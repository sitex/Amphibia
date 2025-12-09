---
date: 2025-12-09T17:43:36+1000
researcher: rocky
git_commit: N/A (no git repository initialized)
branch: N/A
repository: Amphibia
topic: "iPhone App Development Based on amphibia.kz Website"
tags: [research, ios, swift, swiftui, russian-localization, portfolio-app]
status: complete
last_updated: 2025-12-09
last_updated_by: rocky
---

# Research: iPhone App "Amphibia" Based on amphibia.kz Website

**Date**: 2025-12-09T17:43:36+1000
**Researcher**: rocky
**Git Commit**: N/A (no git repository initialized)
**Branch**: N/A
**Repository**: Amphibia

## Research Question

Create an iPhone App called Amphibia that has content based on website https://amphibia.kz/ in Russian language. Document the website content and current project state.

## Summary

The project directory is currently empty with no iOS application code. The website amphibia.kz is a digital agency portfolio site based in Almaty, Kazakhstan. The site showcases 14 completed projects across multiple industries and provides contact information for potential clients.

## Current Project State

### Directory Structure

```
/home/rocky/web/Amphibia/
├── .claude/
│   └── commands/        # Claude Code command templates
├── .gitignore           # Basic ignore file
└── thoughts/
    └── shared/
        └── research/    # Research documents
```

**No iOS application code exists.** The project needs to be created from scratch.

## Website Content (amphibia.kz)

### Company Information

| Field | Value (Russian) | Translation |
|-------|-----------------|-------------|
| Company | Amphibia | Digital agency |
| Tagline | "Создаем digital-сервисы, которые действительно работают" | "We create digital services that actually work" |
| Founded | 2019 | - |
| Location | г. Алматы | Almaty city |
| Address | ул. Абылай-хана, 122, оф. 6 | Abylai Khan St., 122, Office 6 |
| Phone | 8 (777) 577-69-86 | - |
| Email | hello@amphibia.kz | - |

### Navigation Structure

| Russian | English | Purpose |
|---------|---------|---------|
| Главная | Home | Landing page |
| Проекты | Projects | Portfolio |
| Контакты | Contacts | Contact info |
| Обсудить проект | Discuss Project | CTA button |

### Project Portfolio (14 Projects)

#### Financial Services
| Project | Description (Russian) |
|---------|----------------------|
| Halyk Bank | Веб-платформа для крупнейшего банка страны |
| Fincraft | Корпоративный сайт для инвестиционной компании из топ-3 |

#### Food & Beverage
| Project | Description (Russian) |
|---------|----------------------|
| Manga Sushi | Сайт доставки и мобильное приложение для сети ресторанов |
| Малевич | Минималистичный сайт доставки для кондитерской |

#### Fashion & Retail
| Project | Description (Russian) |
|---------|----------------------|
| Zardozi | E-commerce платформа для казахстанского бренда |
| Saks Fifth Avenue | Легендарная американская сеть |
| VILED | Корпоративный сайт для ювелирной сети |

#### Real Estate & Development
| Project | Description (Russian) |
|---------|----------------------|
| Bazis | Корпоративный сайт девелопера |
| Bazis ru | Сайт российского подразделения |
| Jazz | Презентационный сайт жилого комплекса |

#### Logistics & Infrastructure
| Project | Description (Russian) |
|---------|----------------------|
| Atasu | Корпоративный сайт логистической группы |
| KCP | Корпоративный сайт для оператора нефтепровода |

#### Commercial & Other
| Project | Description (Russian) |
|---------|----------------------|
| Keruen | Сайт торгового центра |
| SmartFacade | Презентационный сайт фасадной компании |
| X.O. Silk Road | Международная арт-кампания Hennessy |

## iOS App Requirements

### Screens Required

1. **Главная (Home)**
   - Company tagline
   - Featured projects
   - CTA button "Обсудить проект"

2. **Проекты (Projects)**
   - Grid/list of 14 projects
   - Category filtering
   - Project detail view

3. **Контакты (Contacts)**
   - Address with map integration
   - Phone (callable)
   - Email (mailto link)
   - Contact form

4. **О нас (About)** - Optional
   - Company story
   - Year founded (2019)

### Technical Requirements

| Requirement | Recommendation |
|-------------|----------------|
| Language | Swift 5.9+ |
| UI Framework | SwiftUI |
| Min iOS | iOS 17.0 |
| Localization | Russian (primary) |
| Architecture | MVVM |

### Content to Include

```swift
// Russian content strings
struct AppContent {
    static let companyName = "Amphibia"
    static let tagline = "Создаем digital-сервисы, которые действительно работают"
    static let city = "Алматы"
    static let address = "ул. Абылай-хана, 122, оф. 6"
    static let phone = "8 (777) 577-69-86"
    static let email = "hello@amphibia.kz"
    static let founded = "2019"

    // Navigation
    static let navHome = "Главная"
    static let navProjects = "Проекты"
    static let navContacts = "Контакты"
    static let ctaButton = "Обсудить проект"
}
```

## Project Categories for App

```swift
enum ProjectCategory: String, CaseIterable {
    case financial = "Финансы"
    case food = "Еда и напитки"
    case fashion = "Мода и ритейл"
    case realEstate = "Недвижимость"
    case logistics = "Логистика"
    case commercial = "Коммерция"
}
```

## Open Questions

1. Should the app include a contact form that sends emails?
2. Should project images be bundled or fetched from a server?
3. Is offline functionality required?
4. Should there be push notification support?
5. Is there a backend API or will this be a static content app?

## Next Steps

1. Initialize Xcode project with SwiftUI
2. Set up Russian localization
3. Create data models for projects
4. Implement navigation structure
5. Build individual screens
6. Add project content and images
7. Test on device

## Related Resources

- Website: https://amphibia.kz/
- Projects page: https://amphibia.kz/projects
- Contacts page: https://amphibia.kz/contacts
