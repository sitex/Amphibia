# Amphibia iOS App Implementation Plan

## Overview

Build an iPhone app for Amphibia digital agency that showcases their portfolio of 14 projects. The app will be entirely in Russian, use static bundled content, and follow modern SwiftUI patterns with iOS 17+ as the minimum target.

## Current State Analysis

- **Project directory**: Empty (no iOS code exists)
- **Content source**: amphibia.kz website
- **Language**: Russian only
- **Projects to display**: 14 portfolio projects across 6 categories

### Key Decisions Made:
- Static/bundled content (no backend API)
- Contact via mailto: link (opens Mail app)
- iOS 17.0 minimum deployment target
- SwiftUI with MVVM architecture

## Desired End State

A fully functional iOS app with:
- Tab-based navigation (Home, Projects, Contacts)
- Complete portfolio of 14 projects with category filtering
- Contact information with callable phone and email links
- Clean, modern UI matching the agency's professional image

### Verification:
- App builds and runs on iOS 17+ simulator
- All 14 projects display correctly
- Phone and email links work
- Russian text displays properly throughout

## What We're NOT Doing

- Backend API integration
- Push notifications
- User authentication
- Analytics integration
- iPad-specific layouts (iPhone only)
- English localization (Russian only for now)
- Real project images (will use placeholders initially)

## Implementation Approach

Build incrementally in 4 phases:
1. Project setup and structure
2. Data models and content
3. UI screens implementation
4. Polish and assets

---

## Phase 1: Xcode Project Setup

### Overview
Initialize the Xcode project with proper structure, Russian localization, and SwiftUI configuration.

### Changes Required:

#### 1. Create Xcode Project
**Action**: Create new iOS App project via Xcode or command line

```bash
# Project structure to create:
Amphibia/
├── Amphibia.xcodeproj
├── Amphibia/
│   ├── AmphibiaApp.swift
│   ├── ContentView.swift
│   ├── Info.plist
│   ├── Assets.xcassets/
│   │   ├── AppIcon.appiconset/
│   │   └── AccentColor.colorset/
│   ├── Models/
│   ├── Views/
│   │   ├── Home/
│   │   ├── Projects/
│   │   └── Contacts/
│   ├── ViewModels/
│   └── Resources/
│       └── ru.lproj/
│           └── Localizable.strings
└── AmphibiaTests/
```

#### 2. Configure Project Settings
**File**: `Amphibia.xcodeproj`
**Settings**:
- Deployment Target: iOS 17.0
- Device: iPhone
- Supported orientations: Portrait only
- Development Language: Russian

#### 3. Create App Entry Point
**File**: `Amphibia/AmphibiaApp.swift`

```swift
import SwiftUI

@main
struct AmphibiaApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
```

#### 4. Create Main Tab View
**File**: `Amphibia/Views/MainTabView.swift`

```swift
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
```

### Success Criteria:

#### Automated Verification:
- [ ] Project builds successfully: `xcodebuild -project Amphibia.xcodeproj -scheme Amphibia -sdk iphonesimulator build`
- [ ] No compiler warnings or errors

#### Manual Verification:
- [ ] App launches in simulator
- [ ] Tab bar displays with 3 tabs in Russian
- [ ] Switching tabs works correctly

---

## Phase 2: Data Models & Content

### Overview
Create Swift data models for projects and company information, populate with content from the website.

### Changes Required:

#### 1. Project Category Enum
**File**: `Amphibia/Models/ProjectCategory.swift`

```swift
import Foundation

enum ProjectCategory: String, CaseIterable, Identifiable {
    case financial = "Финансы"
    case food = "Еда и напитки"
    case fashion = "Мода и ритейл"
    case realEstate = "Недвижимость"
    case logistics = "Логистика"
    case commercial = "Коммерция"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .financial: return "banknote"
        case .food: return "fork.knife"
        case .fashion: return "bag"
        case .realEstate: return "building.2"
        case .logistics: return "shippingbox"
        case .commercial: return "storefront"
        }
    }
}
```

#### 2. Project Model
**File**: `Amphibia/Models/Project.swift`

```swift
import Foundation

struct Project: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let category: ProjectCategory
    let imageName: String

    static let allProjects: [Project] = [
        // Financial
        Project(
            name: "Halyk Bank",
            description: "Веб-платформа для крупнейшего банка страны",
            category: .financial,
            imageName: "halyk-bank"
        ),
        Project(
            name: "Fincraft",
            description: "Корпоративный сайт для инвестиционной компании из топ-3",
            category: .financial,
            imageName: "fincraft"
        ),

        // Food & Beverage
        Project(
            name: "Manga Sushi",
            description: "Сайт доставки и мобильное приложение для сети ресторанов",
            category: .food,
            imageName: "manga-sushi"
        ),
        Project(
            name: "Малевич",
            description: "Минималистичный сайт доставки для кондитерской",
            category: .food,
            imageName: "malevich"
        ),

        // Fashion & Retail
        Project(
            name: "Zardozi",
            description: "E-commerce платформа для казахстанского бренда",
            category: .fashion,
            imageName: "zardozi"
        ),
        Project(
            name: "Saks Fifth Avenue",
            description: "Легендарная американская сеть",
            category: .fashion,
            imageName: "saks"
        ),
        Project(
            name: "VILED",
            description: "Корпоративный сайт для ювелирной сети",
            category: .fashion,
            imageName: "viled"
        ),

        // Real Estate
        Project(
            name: "Bazis",
            description: "Корпоративный сайт девелопера",
            category: .realEstate,
            imageName: "bazis"
        ),
        Project(
            name: "Bazis ru",
            description: "Сайт российского подразделения",
            category: .realEstate,
            imageName: "bazis-ru"
        ),
        Project(
            name: "Jazz",
            description: "Презентационный сайт жилого комплекса",
            category: .realEstate,
            imageName: "jazz"
        ),

        // Logistics
        Project(
            name: "Atasu",
            description: "Корпоративный сайт логистической группы",
            category: .logistics,
            imageName: "atasu"
        ),
        Project(
            name: "KCP",
            description: "Корпоративный сайт для оператора нефтепровода",
            category: .logistics,
            imageName: "kcp"
        ),

        // Commercial
        Project(
            name: "Keruen",
            description: "Сайт торгового центра",
            category: .commercial,
            imageName: "keruen"
        ),
        Project(
            name: "SmartFacade",
            description: "Презентационный сайт фасадной компании",
            category: .commercial,
            imageName: "smartfacade"
        ),
        Project(
            name: "X.O. Silk Road",
            description: "Международная арт-кампания Hennessy",
            category: .commercial,
            imageName: "xo-silk-road"
        )
    ]
}
```

#### 3. Company Info Model
**File**: `Amphibia/Models/CompanyInfo.swift`

```swift
import Foundation

struct CompanyInfo {
    static let name = "Amphibia"
    static let tagline = "Создаем digital-сервисы, которые действительно работают"
    static let founded = "2019"
    static let city = "Алматы"
    static let address = "ул. Абылай-хана, 122, оф. 6"
    static let fullAddress = "г. Алматы, ул. Абылай-хана, 122, оф. 6"
    static let phone = "8 (777) 577-69-86"
    static let phoneURL = "tel:+77775776986"
    static let email = "hello@amphibia.kz"
    static let emailURL = "mailto:hello@amphibia.kz"
    static let website = "https://amphibia.kz"

    // Map coordinates for Almaty office
    static let latitude = 43.2567
    static let longitude = 76.9286
}
```

### Success Criteria:

#### Automated Verification:
- [ ] Project builds with all models: `xcodebuild build` (requires macOS)
- [x] All 15 projects are defined in `Project.allProjects`

#### Manual Verification:
- [ ] Models compile without errors
- [ ] Project data matches website content exactly

---

## Phase 3: UI Implementation

### Overview
Build all three main screens with proper navigation and styling.

### Changes Required:

#### 1. Home View
**File**: `Amphibia/Views/Home/HomeView.swift`

```swift
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
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 200, height: 120)
                .overlay {
                    Image(systemName: project.category.icon)
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                }

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
```

#### 2. Projects View
**File**: `Amphibia/Views/Projects/ProjectsView.swift`

```swift
import SwiftUI

struct ProjectsView: View {
    @State private var selectedCategory: ProjectCategory?

    var filteredProjects: [Project] {
        if let category = selectedCategory {
            return Project.allProjects.filter { $0.category == category }
        }
        return Project.allProjects
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Category Filter
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            CategoryChip(
                                title: "Все",
                                isSelected: selectedCategory == nil
                            ) {
                                selectedCategory = nil
                            }

                            ForEach(ProjectCategory.allCases) { category in
                                CategoryChip(
                                    title: category.rawValue,
                                    isSelected: selectedCategory == category
                                ) {
                                    selectedCategory = category
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Projects Grid
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        ForEach(filteredProjects) { project in
                            NavigationLink(destination: ProjectDetailView(project: project)) {
                                ProjectCard(project: project)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Проекты")
        }
    }
}

struct CategoryChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.accentColor : Color.gray.opacity(0.1))
                .foregroundStyle(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
    }
}

struct ProjectCard: View {
    let project: Project

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .aspectRatio(1.2, contentMode: .fit)
                .overlay {
                    Image(systemName: project.category.icon)
                        .font(.title)
                        .foregroundStyle(.secondary)
                }

            Text(project.name)
                .font(.headline)
                .lineLimit(1)

            Text(project.category.rawValue)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ProjectsView()
}
```

#### 3. Project Detail View
**File**: `Amphibia/Views/Projects/ProjectDetailView.swift`

```swift
import SwiftUI

struct ProjectDetailView: View {
    let project: Project

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Hero Image
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.2))
                    .aspectRatio(16/9, contentMode: .fit)
                    .overlay {
                        Image(systemName: project.category.icon)
                            .font(.system(size: 60))
                            .foregroundStyle(.secondary)
                    }

                VStack(alignment: .leading, spacing: 16) {
                    // Category Badge
                    HStack {
                        Image(systemName: project.category.icon)
                        Text(project.category.rawValue)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(Capsule())

                    // Title
                    Text(project.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    // Description
                    Text(project.description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(project.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProjectDetailView(project: Project.allProjects[0])
    }
}
```

#### 4. Contacts View
**File**: `Amphibia/Views/Contacts/ContactsView.swift`

```swift
import SwiftUI
import MapKit

struct ContactsView: View {
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: CompanyInfo.latitude,
                longitude: CompanyInfo.longitude
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Map
                    Map(position: $cameraPosition) {
                        Marker(CompanyInfo.name, coordinate: CLLocationCoordinate2D(
                            latitude: CompanyInfo.latitude,
                            longitude: CompanyInfo.longitude
                        ))
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)

                    // Contact Cards
                    VStack(spacing: 16) {
                        ContactCard(
                            icon: "mappin.circle.fill",
                            title: "Адрес",
                            value: CompanyInfo.fullAddress,
                            action: nil
                        )

                        ContactCard(
                            icon: "phone.circle.fill",
                            title: "Телефон",
                            value: CompanyInfo.phone,
                            action: {
                                if let url = URL(string: CompanyInfo.phoneURL) {
                                    UIApplication.shared.open(url)
                                }
                            }
                        )

                        ContactCard(
                            icon: "envelope.circle.fill",
                            title: "Email",
                            value: CompanyInfo.email,
                            action: {
                                if let url = URL(string: CompanyInfo.emailURL) {
                                    UIApplication.shared.open(url)
                                }
                            }
                        )
                    }
                    .padding(.horizontal)

                    // CTA Button
                    Button(action: {
                        if let url = URL(string: CompanyInfo.emailURL + "?subject=Обсуждение проекта") {
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
                    .padding(.bottom, 32)
                }
                .padding(.top)
            }
            .navigationTitle("Контакты")
        }
    }
}

struct ContactCard: View {
    let icon: String
    let title: String
    let value: String
    let action: (() -> Void)?

    var body: some View {
        Button(action: { action?() }) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundStyle(.accentColor)
                    .frame(width: 44)

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Text(value)
                        .font(.body)
                        .foregroundStyle(.primary)
                }

                Spacer()

                if action != nil {
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
        .disabled(action == nil)
    }
}

#Preview {
    ContactsView()
}
```

### Success Criteria:

#### Automated Verification:
- [ ] Project builds with all views: `xcodebuild build`
- [ ] No SwiftUI preview errors

#### Manual Verification:
- [ ] Home screen displays tagline and featured projects
- [ ] Projects screen shows all 14 projects in grid
- [ ] Category filtering works correctly
- [ ] Project detail view shows full information
- [ ] Contacts screen displays map, address, phone, email
- [ ] Phone link opens dialer
- [ ] Email link opens Mail app
- [ ] All Russian text displays correctly

---

## Phase 4: Polish & Assets

### Overview
Add app icons, accent colors, and finalize styling.

### Changes Required:

#### 1. Configure Accent Color
**File**: `Amphibia/Assets.xcassets/AccentColor.colorset/Contents.json`

```json
{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.459",
          "green" : "0.329",
          "red" : "0.000"
        }
      },
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

#### 2. Add Placeholder App Icon
**Action**: Create a simple app icon or placeholder in Assets.xcassets/AppIcon.appiconset

#### 3. Update Info.plist for Localizations
**File**: `Amphibia/Info.plist`
**Add Keys**:
- CFBundleDisplayName: Amphibia
- CFBundleDevelopmentRegion: ru

### Success Criteria:

#### Automated Verification:
- [ ] Project builds successfully with assets
- [ ] No missing asset warnings

#### Manual Verification:
- [ ] Accent color appears correctly (blue-green tint)
- [ ] App name displays as "Amphibia"
- [ ] App runs smoothly without visual glitches

---

## Testing Strategy

### Unit Tests:
- Model initialization tests
- Project filtering logic
- URL generation for phone/email

### Manual Testing Steps:
1. Launch app and verify Home tab displays correctly
2. Navigate to Projects tab
3. Test each category filter
4. Tap a project to view details
5. Navigate to Contacts tab
6. Tap phone number to verify dialer opens
7. Tap email to verify Mail app opens
8. Tap "Обсудить проект" button

---

## File Structure Summary

```
Amphibia/
├── Amphibia.xcodeproj
├── Amphibia/
│   ├── AmphibiaApp.swift
│   ├── Assets.xcassets/
│   ├── Models/
│   │   ├── CompanyInfo.swift
│   │   ├── Project.swift
│   │   └── ProjectCategory.swift
│   └── Views/
│       ├── MainTabView.swift
│       ├── Home/
│       │   └── HomeView.swift
│       ├── Projects/
│       │   ├── ProjectsView.swift
│       │   └── ProjectDetailView.swift
│       └── Contacts/
│           └── ContactsView.swift
└── thoughts/
    └── shared/
        ├── research/
        │   └── 2025-12-09-amphibia-ios-app-research.md
        └── plans/
            └── 2025-12-09-amphibia-ios-app.md
```

---

## References

- Research document: `thoughts/shared/research/2025-12-09-amphibia-ios-app-research.md`
- Website: https://amphibia.kz/
