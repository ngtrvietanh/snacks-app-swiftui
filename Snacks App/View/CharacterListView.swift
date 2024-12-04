//
//  CharacterListView.swift
//  Snacks App
//
//  Created by Việt Anh on 4/12/24.
//


import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    CharacterRow(character: character)
                        .onAppear {
                            // Khi mục cuối cùng xuất hiện, tải thêm dữ liệu
                            if character.id == viewModel.characters.last?.id {
                                viewModel.fetchCharacters()
                            }
                        }
                }
                
                if viewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
            }
            .navigationTitle("Rick & Morty Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

struct CharacterRow: View {
    let character: Character // Thông tin nhân vật
    
    var body: some View {
        HStack(spacing: 16) {
            // Ảnh nhân vật
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView() // Hiển thị vòng tải khi đang tải ảnh
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            
            // Tên nhân vật
            Text(character.name)
                .font(.headline)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Spacer() // Đẩy nội dung về bên trái
        }
        .padding(.vertical, 8) // Khoảng cách dọc giữa các dòng
    }
}

#Preview {
    CharacterListView()
}
