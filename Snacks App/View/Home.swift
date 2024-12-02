//
//  Home.swift
//  Snacks App
//
//  Created by Việt Anh on 2/12/24.
//

import SwiftUI

struct Home: View {
    @State var selectedCategory = "All"
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    //Header
                    HStack {
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        Spacer()
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70,height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    //Category List
                    CategoryListView(selectedCategory: $selectedCategory)
                    //Product List
                    HStack {
                        Text("Choco **Collections**")
                            .font(.system(size: 24))
                        Spacer()
                        NavigationLink {
                            CollectionView()
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach (productList, id: \.id) {item in
                                ProductCard(product: item)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ProductCard: View {
    var product: ProductModel
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
            ZStack {
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 36, weight: .semibold))
                        .frame(width: 140)
                    Text("\(product.category)")
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    Spacer()
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 24, weight: .semibold))
                        Spacer()
                        Button {
                            
                        } label: {
                            Image (systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 98, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                })
            }
            .padding(30)
            .frame(width: 336, height: 422)
        }
//        .padding(30)
        .frame(width: 336, height: 422)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 20)
    }
}

#Preview {
    Home()
}
