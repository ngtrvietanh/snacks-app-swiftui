//
//  ContentView.swift
//  Snacks App
//
//  Created by Việt Anh on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        LoginView()
    }
}

#Preview {
    ContentView()
}
