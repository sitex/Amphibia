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
