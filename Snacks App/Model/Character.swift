//
//  Character.swift
//  Snacks App
//
//  Created by Việt Anh on 4/12/24.
//


import Foundation

struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let image: String
}

struct CharacterResponse: Codable {
    let results: [Character]
    let info: PageInfo
}

struct PageInfo: Codable {
    let next: String?
}
