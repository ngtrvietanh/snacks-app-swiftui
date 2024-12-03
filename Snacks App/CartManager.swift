//
//  CartManager.swift
//  Snacks App
//
//  Created by Việt Anh on 3/12/24.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published private(set) var products: [ProductModel] = []
    @Published private(set) var total: Int = 0
    
    func addToCard (product:ProductModel) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart (product:ProductModel) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}
