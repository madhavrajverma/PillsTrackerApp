//
//  PTTextField.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 28/07/22.
//

import SwiftUI

struct PTTextField: View {
    @Binding var text:String
    let placeholder:String
    var body: some View {
        VStack {
            TextField(placeholder, text: $text)
                .disableAutocorrection(true)
            Rectangle()
                .fill(Color.textFieldColor)
                .frame(height: 2)
                .edgesIgnoringSafeArea(.horizontal)
        }
        .padding()
    }
}

struct PTTextField_Previews: PreviewProvider {
    static var previews: some View {
        PTTextField(text: .constant("Hello"),placeholder: "Name")
    }
}
