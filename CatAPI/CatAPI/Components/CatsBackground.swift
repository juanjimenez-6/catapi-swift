//
//  CatsBackground.swift
//  CatAPI
//
//  Created by J on 13/3/24.
//

import SwiftUI

struct CatsBackground: View {
    var content: (() -> any View)?
    
    init() {
        self.content = nil
    }
    init(@ViewBuilder content: @escaping () -> any View) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Image("cats")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 6)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            if let content {
                AnyView(content())
            }
        }
    }
}
