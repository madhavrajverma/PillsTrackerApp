//
//  MedicineTextDetailView.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 28/07/22.
//

import SwiftUI

struct MedicineTextDetailView: View {
    let title:String
    let subtitle:String
    var body: some View {
        VStack(alignment:.leading,spacing: 6) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.primaryText)
            
            Text(subtitle)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.mainHeadingText)
        }
    }
}

struct MedicineTextDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineTextDetailView(title: "Pills Name", subtitle: "Clofen Forte")
    }
}
