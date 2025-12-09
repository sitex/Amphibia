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
