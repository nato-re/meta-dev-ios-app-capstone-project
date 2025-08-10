//
//  MenuItem.swift
//  M4Exercise
//
//  Created by nato on 10/08/25.
//
import Foundation

struct MenuItem: Codable, Hashable, Identifiable {
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
