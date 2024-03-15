//
//  RandomCatView.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import SwiftUI

struct RandomCatView: View {
    @ObservedObject var viewModel = RandomCatViewModel()
    let userId = "juanjimenez001"
    
    var body: some View {
        CatsBackground {
            VStack {
                VStack(alignment:.center) {
                    if let catImage = viewModel.catImage {
                        CatImageView(url: catImage.url)
                    }
                    if viewModel.isLoading {
                        ProgressView("Fetching Cat Data...")
                            .frame(width: 350, height: 350)
                    }
                }
                .padding(.all, 10)
                .background(Color.white.opacity(0.4))
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
                
                VStack(alignment:.center) {
                    HStack(spacing: 20) {
                        Button("Fetch Another Cat") {
                            viewModel.fetchRandomCatImage()
                        }
                        .buttonStyle(ActionButton())
                        if let favorite = viewModel.favorite {
                            Button("Remove From favorites") {
                                viewModel.deleteFavorite(forFavoriteId: favorite.id)
                            }
                            .buttonStyle(ActionButton())
                            .disabled(viewModel.catImage == nil)
                        } else {
                            Button("Add Cat To Favorites") {
                                if let catImage = viewModel.catImage {
                                    viewModel.createFavorite(forImageId: catImage.id, subId: userId)
                                }
                            }
                            .buttonStyle(ActionButton())
                            .disabled(viewModel.catImage == nil)
                        }
                    }
                }
                .padding([.leading, .trailing], 10)
                .frame(height: 80)
                .background(Color.white.opacity(0.4))
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
            }
            .frame(maxWidth: .infinity)
            .onAppear {
                if (viewModel.catImage == nil)  {
                    viewModel.fetchRandomCatImage()
                }
            }
            .alert("Error", isPresented: Binding<Bool>.constant($viewModel.errorMessage.wrappedValue != nil), presenting: viewModel.errorMessage) { _ in
                Button("OK", role: .cancel) { }
            } message: { errorMessage in
                Text(errorMessage)
            }
        }
    }
}

#Preview {
    RandomCatView()
}
