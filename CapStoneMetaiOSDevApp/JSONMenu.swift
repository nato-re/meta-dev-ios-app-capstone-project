//
//  JSONMenu.swift
//  M4Exercise
//
//  Created by nato on 10/08/25.
//


struct MenuList: Codable {
    // add code here
    var menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}


