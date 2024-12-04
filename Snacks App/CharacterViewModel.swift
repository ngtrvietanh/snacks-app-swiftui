//
//  CharacterViewModel.swift
//  Snacks App
//
//  Created by Việt Anh on 4/12/24.
//


import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    
    private var currentPage: Int = 1 // Theo dõi số trang hiện tại
    private let apiService = APIService()
    
    func fetchCharacters() {
        guard !isLoading else { return }
        isLoading = true

        let url = "https://rickandmortyapi.com/api/character?page=\(currentPage)"
        
        apiService.fetchCharacters(url: url) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.characters.append(contentsOf: response.results)
                    if response.info.next != nil {
                        self?.currentPage += 1 // Tăng số trang nếu còn dữ liệu
                    }
                case .failure(let error):
                    print("Failed to fetch characters: \(error.localizedDescription)")
                }
            }
        }
    }
}

