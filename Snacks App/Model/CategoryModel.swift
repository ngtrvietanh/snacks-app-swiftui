//
//  CategoryModel.swift
//  Snacks App
//
//  Created by Việt Anh on 2/12/24.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "star.fill", title: "Choco"),
    CategoryModel(icon: "heart.fill", title: "Waffles"),
    CategoryModel(icon: "airplane", title: "Toffee"),
]
