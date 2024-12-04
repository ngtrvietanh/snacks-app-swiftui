import Foundation

class APIService {
    func fetchCharacters(url: String, completion: @escaping (Result<CharacterResponse, Error>) -> Void) {
        guard let endpoint = URL(string: url) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: endpoint) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -2, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
