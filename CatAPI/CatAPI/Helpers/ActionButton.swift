//
//  ActionStyle.swift
//  CatAPI
//
//  Created by J on 13/3/24.
//

import SwiftUI

/// Button Style for the main CTAs
struct ActionButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.1))
    }
}
