import SwiftUI

struct ProjectsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Наши проекты")
                    .font(.title2)
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("Проекты")
        }
    }
}

#Preview {
    ProjectsView()
}
