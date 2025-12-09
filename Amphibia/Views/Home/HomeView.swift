import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Amphibia")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Создаем digital-сервисы, которые действительно работают")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .navigationTitle("Главная")
        }
    }
}

#Preview {
    HomeView()
}
