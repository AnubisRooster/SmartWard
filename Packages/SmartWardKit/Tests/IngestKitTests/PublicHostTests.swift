import XCTest
@testable import IngestKit

final class PublicHostTests: XCTestCase {

    func testOnlyPublicNamedHosts() {
        for host in ["vllm.ai", "export.arxiv.org", "API.GitHub.com", "xn--bcher-kva.example.xn--p1ai"] {
            XCTAssertTrue(PublicHost.isPublic(host), host)
        }
        for host in ["localhost", "router", "127.0.0.1", "127.1", "0x7f.0.0.1", "10.0.0.8", "::1",
                     "printer.local", "metadata.internal", "nas.lan", "home.home.arpa", "example.123"] {
            XCTAssertFalse(PublicHost.isPublic(host), host)
        }
    }

    func testRedirectsCantReachThisDeviceOrItsNetwork() throws {
        func allows(_ url: String) throws -> Bool { PublicHost.allowsRedirect(to: try XCTUnwrap(URL(string: url))) }
        XCTAssertTrue(try allows("https://blog.example.com/post"))
        XCTAssertTrue(try allows("http://example.com:443/a"))
        XCTAssertFalse(try allows("http://127.0.0.1:8080/admin"))
        XCTAssertFalse(try allows("http://169.254.169.254/latest/meta-data/"))
        XCTAssertFalse(try allows("http://router.local/config"))
        XCTAssertFalse(try allows("https://example.com:8443/"))
        XCTAssertFalse(try allows("https://user:pass@example.com/"))
        XCTAssertFalse(try allows("file:///etc/passwd"))
    }
}
