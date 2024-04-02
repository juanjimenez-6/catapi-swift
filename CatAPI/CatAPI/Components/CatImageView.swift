//
//  CatImageView.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import SwiftUI

/// This is a reusable component that lazily loads a remote image from an external url
struct CatImageView: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView("Loading Cat...")
                .frame(width: 335, height: 335)
        }
        .frame(width: 335, height: 335)
        .cornerRadius(10)
    }
}
