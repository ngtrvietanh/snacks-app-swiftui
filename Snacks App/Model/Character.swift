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
