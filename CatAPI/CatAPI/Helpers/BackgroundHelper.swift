//
//  BackgroundHelper.swift
//  CatAPI
//
//  Created by J on 13/3/24.
//

import SwiftUI

//The hosting view of every tab has system background color (which is opaque), this makes it transparent

struct BackgroundHelper: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            var parent = view.superview
            repeat {
                if parent?.backgroundColor != nil {
                    parent?.backgroundColor = UIColor.clear
                    break
                }
                parent = parent?.superview
            } while (parent != nil)
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
