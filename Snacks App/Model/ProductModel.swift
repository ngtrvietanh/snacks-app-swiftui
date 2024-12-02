//
//  ProductModel.swift
//  Snacks App
//
//  Created by Việt Anh on 2/12/24.
//

import SwiftUI

struct ProductModel: Identifiable, Hashable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

var productList: [ProductModel] = [
    ProductModel(name: "Good Source", category: "Choco", image: "image 1", color: .pink , price: 8),
    ProductModel(name: "Unreal Muffins", category: "Choco", image: "image 1", color: .green , price: 8),
    ProductModel(name: "Twister Chips", category: "Chips", image: "image 1", color: .blue , price: 8),
    ProductModel(name: "Twister Chips", category: "Chips", image: "image 1", color: .yellow , price: 8),
    ProductModel(name: "Regular Nature", category: "Chips", image: "image 1", color: .brown , price: 8),
    ProductModel(name: "Dark Russet", category: "Chips", image: "image 1", color: .orange , price: 8),
    ProductModel(name: "Smiths Chips", category: "Chips", image: "image 1", color: .purple , price: 8),
    ProductModel(name: "Deep River", category: "Chips", image: "image 1", color: .red , price: 8),
]
