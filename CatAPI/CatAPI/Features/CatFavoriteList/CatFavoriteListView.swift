//
//  CatFavoriteListView.swift
//  CatAPI
//
//  Created by J on 13/3/24.
//

import SwiftUI

struct CatFavoriteListView: View {
    @ObservedObject var viewModel = CatFavoriteListViewModel()
    
    var body: some View {
        NavigationView {
            CatsBackground {
                if viewModel.favorites.isEmpty {
                    VStack(alignment:.center) {
                        Text("No Favorites")
                    }
                    .padding([.leading, .trailing], 10)
                    .frame(height: 30)
                    .background(Color.white.opacity(0.4))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )
                }
                List(viewModel.favorites) { favorite in
                    HStack (spacing: 0) {
                        if let image = favorite.image {
                            AsyncImage(url: URL(string: image.url)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 70, height: 70)
                            .cornerRadius(8)
                        }
                        
                        Text("Favorite ID: \(favorite.id)")
                            .frame(maxWidth: .infinity)
                        
                        Button("Remove") {
                            viewModel.showConfirmDialog = true
                            viewModel.favoriteToDelete = favorite.id
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderless)
                    }
                    .frame(height: 70)
                    .background(NavigationLink("", destination: HStack (spacing: 0) {
                        if let image = favorite.image {
                            AsyncImage(url: URL(string: image.url)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 350, height: 350)
                            .cornerRadius(8)
                        }}))
                }
                .scrollContentBackground(.hidden)
                .onAppear {
                    viewModel.fetchFavoriteCats()
                }
                .alert("Error", isPresented: Binding<Bool>.constant(viewModel.errorMessage != nil), presenting: viewModel.errorMessage) { _ in
                    Button("OK", role: .cancel) { }
                } message: { errorMessage in
                    Text(errorMessage)
                }
                .alert(isPresented: $viewModel.showConfirmDialog) {
                    Alert(
                        title: Text("Delete Favorite"),
                        message: Text("Are you sure you want to delete this favorite?"),
                        primaryButton: .destructive(Text("Delete")) {
                            if let favoriteToDeleteId = viewModel.favoriteToDelete {
                                print(favoriteToDeleteId)
                                viewModel.deleteFavorite(forFavoriteId: favoriteToDeleteId) { result in 
                                    switch result {
                                    case .success(_):
                                        print("Success deleting favorite")
                                        viewModel.fetchFavoriteCats()
                                    case .failure(let error):
                                        print("An error occurred: \(error.localizedDescription)")
                                    }
                                                    
                                }
                            }
                        },
                        secondaryButton: .cancel {
                            viewModel.favoriteToDelete = nil
                            viewModel.showConfirmDialog = false
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    CatFavoriteListView()
}
