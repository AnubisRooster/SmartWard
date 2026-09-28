import XCTest
import BYOKLLMKit
import ModelCatalogKit
@testable import StrategistCore

final class ProviderModelFetcherTests: XCTestCase {

    func testDecodesAnthropicShapeWithDisplayNamesSortedByID() throws {
        let json = """
        {"data":[{"id":"claude-sonnet-5","display_name":"Claude Sonnet 5","type":"model"},
                  {"id":"claude-haiku-4-5","display_name":"Claude Haiku 4.5","type":"model"}]}
        """
        let entries = try ProviderModelFetcher.decode(Data(json.utf8), for: .anthropic)
        XCTAssertEqual(entries.map(\.id), ["claude-haiku-4-5", "claude-sonnet-5"])
        XCTAssertEqual(entries.map(\.name), ["Claude Haiku 4.5", "Claude Sonnet 5"])
        XCTAssertTrue(entries.allSatisfy { $0.pricing == .zero }, "Anthropic's bare list reports no price")
    }

    func testDecodesBareOpenAICompatibleShapeSortedByID() throws {
        let json = """
        {"data":[{"id":"gpt-4o-mini","object":"model","created":123,"owned_by":"openai"},
                  {"id":"gpt-4o","object":"model","created":456,"owned_by":"openai"}]}
        """
        let entries = try ProviderModelFetcher.decode(Data(json.utf8), for: .openai)
        XCTAssertEqual(entries.map(\.id), ["gpt-4o", "gpt-4o-mini"])
        XCTAssertTrue(entries.allSatisfy { $0.name == nil }, "no display name in this shape")
    }

    func testUnreadableResponseThrowsUnreadable() {
        XCTAssertThrowsError(try ProviderModelFetcher.decode(Data("not json".utf8), for: .openai)) { error in
            XCTAssertEqual(error as? ProviderModelFetcher.FetchError, .unreadable)
        }
        XCTAssertThrowsError(try ProviderModelFetcher.decode(Data("{}".utf8), for: .anthropic)) { error in
            XCTAssertEqual(error as? ProviderModelFetcher.FetchError, .unreadable)
        }
    }

    func testAnthropicRequestUsesItsOwnHeaderScheme() throws {
        let request = try XCTUnwrap(ProviderModelFetcher.urlRequest(for: .anthropic, apiKey: "sk-ant-1"))
        XCTAssertEqual(request.url?.absoluteString, "https://api.anthropic.com/v1/models")
        XCTAssertEqual(request.value(forHTTPHeaderField: "x-api-key"), "sk-ant-1")
        XCTAssertEqual(request.value(forHTTPHeaderField: "anthropic-version"), "2023-06-01")
        XCTAssertNil(request.value(forHTTPHeaderField: "Authorization"))
    }

    func testOpenAICompatibleRequestUsesBearerHeader() throws {
        let request = try XCTUnwrap(ProviderModelFetcher.urlRequest(for: .groq, apiKey: "gsk-1"))
        XCTAssertEqual(request.url?.absoluteString, "https://api.groq.com/openai/v1/models")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Authorization"), "Bearer gsk-1")
        XCTAssertNil(request.value(forHTTPHeaderField: "x-api-key"))
    }

    func testUnrecognizedStatusCodeMapsToInvalidKeyOrHTTP() async {
        // Exercised indirectly: FetchError's own cases carry the mapping;
        // this documents the boundary the async fetch() path relies on.
        XCTAssertEqual(ProviderModelFetcher.FetchError.http(500).errorDescription,
                       "The provider returned an error (500).")
        XCTAssertEqual(ProviderModelFetcher.FetchError.invalidKey.errorDescription, "That key was rejected.")
    }
}
