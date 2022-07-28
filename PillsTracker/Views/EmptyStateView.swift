//
//  EmptyStateView.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 28/07/22.
//

import SwiftUI

struct EmptyStateView: View {
    let title:String
    let subtitle:String
    var body: some View {
        VStack {
            VStack(alignment:.center,spacing: 6) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(Color.primaryText)
            }
            Image(Constants.emptyImage.rawValue)
                .resizable()
                .scaledToFit()
                .frame(maxWidth:.infinity)
                .frame(height:300)
                .padding()
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(title: "No Medicine Found", subtitle: "Add New Medicine")
    }
}
