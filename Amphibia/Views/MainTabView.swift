import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }

            ProjectsView()
                .tabItem {
                    Label("Проекты", systemImage: "folder.fill")
                }

            ContactsView()
                .tabItem {
                    Label("Контакты", systemImage: "envelope.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}
