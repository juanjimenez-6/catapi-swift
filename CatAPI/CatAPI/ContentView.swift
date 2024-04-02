//
//  ContentView.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView {
                RandomCatView()
                    .tabItem {
                        Label("Random Cat", systemImage: "square.and.arrow.down")
                    }
                CatFavoriteListView()
                    .tabItem {
                        Label("Favorites", systemImage: "bolt.heart")
                    }
            }
            .navigationTitle("CatAPI")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.yellow.opacity(0.6), for: .navigationBar)
        }
        
    }
}

#Preview {
    ContentView()
}
