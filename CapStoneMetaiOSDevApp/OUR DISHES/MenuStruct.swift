import Foundation

struct JSONMenu: Codable {
    // add code here
    var menu: [MenuItemStruct]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}


struct MenuItemStruct: Codable, Hashable, Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let description: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case description = "description"
        case image = "image"
    }
    // add code here
}
