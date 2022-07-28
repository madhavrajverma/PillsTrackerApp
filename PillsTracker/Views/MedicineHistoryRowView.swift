//
//  MedicineHistoryRowView.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 29/07/22.
//

import SwiftUI

struct MedicineHistoryRowView: View {
    
    let history : HistoryViewModel
    
    var body: some View {
        VStack(spacing:20) {
            
            Image(history.type.image)
                .resizable()
                .scaledToFit()
                .frame(width:60,height: 60)
            
            
            VStack(spacing:20) {
                Text("\(history.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                VStack(alignment:.leading,spacing: 10) {
                    Text("Remaining Doses: \(history.count)")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.textFieldColor)
                    
                    
                    Text("Remaining Days: \(history.days)")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.textFieldColor)
                }
            }
        }
        .padding()
        .padding(.vertical)
        .background(history.type.background.cornerRadius(16))
    }
}

struct MedicineHistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineHistoryRowView(history: HistoryViewModel(history: History(context: CoreDataManager.shared.viewContext)))
    }
}
