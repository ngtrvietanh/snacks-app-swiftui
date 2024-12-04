import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        
                        Text(character.name)
                            .font(.headline)
                    }
                }
                
                if viewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                } else {
                    HStack {
                        Spacer()
                        Text("Load More")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                viewModel.fetchCharacters()
                            }
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
