//
//  HomeHeaderView.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 28/07/22.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
       
        HStack(alignment:.top) {
                VStack(alignment:.leading,spacing: 10) {
                    Text("Worry Less Live \n Healthier")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.mainHeadingText)
                      
                       
                    Text("Get Medicine On Time")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding()
                Spacer()
                Image(Constants.headerImage.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 80, maxWidth: 100, minHeight: 80, maxHeight: 100)
                    .padding()
            }
            .frame(height:160)
            .frame(maxWidth:.infinity)
            .background(Color.headerBackground)
            .cornerRadius(20)
           
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
