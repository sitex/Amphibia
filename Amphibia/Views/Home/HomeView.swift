import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    // Hero Section
                    VStack(spacing: 16) {
                        Text(CompanyInfo.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text(CompanyInfo.tagline)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.top, 40)

                    // Featured Projects
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Избранные проекты")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(Project.allProjects.prefix(4)) { project in
                                    FeaturedProjectCard(project: project)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // CTA Button
                    Button(action: {
                        if let url = URL(string: CompanyInfo.emailURL) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Обсудить проект")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)

                    // Company Info
                    VStack(spacing: 8) {
                        Text("Работаем с \(CompanyInfo.founded) года")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Text(CompanyInfo.city)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("Главная")
        }
    }
}

struct FeaturedProjectCard: View {
    let project: Project

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(project.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(project.name)
                .font(.headline)

            Text(project.category.rawValue)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(width: 200)
    }
}

#Preview {
    HomeView()
}
