//
//  ButtomViewModifier.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 29/07/22.
//


import SwiftUI

struct ButtonViewModifier: ViewModifier {
    let btnColor:Color
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.white)
            .padding()
            .frame(width:120)
            .background(btnColor)
            .cornerRadius(10)
            
    }
}
