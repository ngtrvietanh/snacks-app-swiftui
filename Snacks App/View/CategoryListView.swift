//
//  CategoryListView.swift
//  Snacks App
//
//  Created by Việt Anh on 2/12/24.
//

import SwiftUI


struct CategoryListView: View {
    @Binding var selectedCategory: String // Liên kết với @State trong Home
    
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack {
                                if !item.icon.isEmpty {
                                    Image(systemName: item.icon)
                                        .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                }
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}
#Preview {
    @Previewable @State var dummySelectedCategory = ""
    return CategoryListView(selectedCategory: $dummySelectedCategory)
}
