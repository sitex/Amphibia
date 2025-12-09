import SwiftUI

struct ContactsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Свяжитесь с нами")
                    .font(.title2)
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("Контакты")
        }
    }
}

#Preview {
    ContactsView()
}
