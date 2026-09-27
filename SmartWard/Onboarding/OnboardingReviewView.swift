import SwiftUI
import StrategistCore

/// The confirm screen: every proposed project, source and topic can be edited
/// or dropped before anything is created.
struct OnboardingReviewView: View {
    let onApply: (OnboardingProposal) -> Void
    let onBack: () -> Void

    @State private var proposal: OnboardingProposal
    @State private var skippedProjects: Set<Int> = []
    @State private var skippedSources: Set<Int> = []
    @State private var topicsText: String
    @State private var mutedText: String

    init(proposal: OnboardingProposal,
         onApply: @escaping (OnboardingProposal) -> Void,
         onBack: @escaping () -> Void) {
        self.onApply = onApply
        self.onBack = onBack
        _proposal = State(initialValue: proposal)
        _topicsText = State(initialValue: proposal.topics.joined(separator: ", "))
        _mutedText = State(initialValue: proposal.mutedTopics.joined(separator: ", "))
    }

    var body: some View {
        Form {
            Section {
                if proposal.projects.isEmpty {
                    Text("No projects proposed.").foregroundStyle(.secondary)
                }
                ForEach(proposal.projects.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 6) {
                        Toggle(isOn: included(index, in: $skippedProjects)) {
                            TextField("Name", text: $proposal.projects[index].name)
                                .font(.headline)
                        }
                        TextField("Goal", text: $proposal.projects[index].goal, axis: .vertical)
                            .font(.subheadline)
                        ForEach(proposal.projects[index].links, id: \.self) { link in
                            Label(link, systemImage: "link")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .opacity(skippedProjects.contains(index) ? 0.4 : 1)
                }
            } header: {
                Text("Projects")
            }

            Section {
                if proposal.sources.isEmpty {
                    Text("No sources proposed.").foregroundStyle(.secondary)
                }
                ForEach(proposal.sources.indices, id: \.self) { index in
                    Toggle(isOn: included(index, in: $skippedSources)) {
                        VStack(alignment: .leading) {
                            Text(proposal.sources[index].title.isEmpty ? proposal.sources[index].url
                                                                       : proposal.sources[index].title)
                            Text("\(proposal.sources[index].kind) · \(proposal.sources[index].url)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                }
            } header: {
                Text("Sources to follow")
            } footer: {
                Text("Fetching sources arrives with the ingestion update; they're saved now so it can start right away.")
            }

            Section("What to watch for") {
                TextField("Interests", text: $proposal.interestStatement, axis: .vertical)
                TextField("Topics (comma-separated)", text: $topicsText, axis: .vertical)
                TextField("Topics to ignore (comma-separated)", text: $mutedText, axis: .vertical)
            }
        }
        .navigationTitle("Your setup")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Back", action: onBack)
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Create") { onApply(confirmed) }
            }
        }
    }

    private var confirmed: OnboardingProposal {
        var result = proposal
        result.projects = proposal.projects.enumerated()
            .filter { !skippedProjects.contains($0.offset) }
            .map { $0.element }
        result.sources = proposal.sources.enumerated()
            .filter { !skippedSources.contains($0.offset) }
            .map { $0.element }
        result.topics = Self.split(topicsText)
        result.mutedTopics = Self.split(mutedText)
        return result
    }

    private func included(_ index: Int, in skipped: Binding<Set<Int>>) -> Binding<Bool> {
        Binding(
            get: { !skipped.wrappedValue.contains(index) },
            set: { include in
                if include {
                    skipped.wrappedValue.remove(index)
                } else {
                    skipped.wrappedValue.insert(index)
                }
            }
        )
    }

    private static func split(_ text: String) -> [String] {
        text.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
    }
}
