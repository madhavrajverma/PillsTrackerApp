//
//  MedicineRowView.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 28/07/22.
//

import SwiftUI

struct MedicineRowView: View {
    let medicine:MedicineViewModel
    var body: some View {
        HStack(alignment:.center,spacing: 10) {
            Image(medicine.type.image)
                .resizable()
                .frame(width:60,height: 60)
                .padding()
            VStack(alignment:.leading,spacing: 6) {
                Text(medicine.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(medicine.desc)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.secondaryText)
                Spacer()
                HStack {
                    Text("Dosages:\(medicine.dosages)")
                        .font(.caption)
                        .foregroundColor(Color.captionText)
                    Spacer()
                    Text("Days:\(medicine.days)")
                        .font(.caption)
                        .foregroundColor(Color.captionText)
                }
                .padding(.trailing)
                
            }
            .padding(.vertical)
            Spacer()
        }.frame(maxWidth:.infinity)
            .frame(height:120)
            .background(medicine.type.background)
            .cornerRadius(20)
            
      
    }
}

struct MedicineRowView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineRowView(medicine: MedicineViewModel(medicine: Medicine(context: CoreDataManager.shared.viewContext)))
    }
}
