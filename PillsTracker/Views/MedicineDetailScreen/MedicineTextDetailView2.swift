//
//  MedicineTextDetailView2.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 28/07/22.
//

import SwiftUI

struct MedicineTextDetailView2: View {
    let title:String
    let subtitle:String
    
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black.opacity(0.8))
            
            Text(subtitle)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.primaryText)
        }
    }
}

struct MedicineTextDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        MedicineTextDetailView2(title: "Description:", subtitle: "2 times a day with Water")
    }
}
