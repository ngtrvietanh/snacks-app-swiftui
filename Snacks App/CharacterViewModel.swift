import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    
    private var nextURL: String? = "https://rickandmortyapi.com/api/character?page=1"
    private let apiService = APIService()
    
    func fetchCharacters() {
        guard let url = nextURL, !isLoading else { return }
        isLoading = true
        
        apiService.fetchCharacters(url: url) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.characters.append(contentsOf: response.results)
                    self?.nextURL = response.info.next
                case .failure(let error):
                    print("Failed to fetch characters: \(error.localizedDescription)")
                }
            }
        }
    }
}
