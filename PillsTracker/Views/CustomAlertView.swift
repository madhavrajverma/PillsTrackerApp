//
//  CustomAlertView.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 28/07/22.
//

import SwiftUI

struct CustomAlertView: View {
    
    @Binding var alertIsVisible: Bool
    let medicine:MedicineViewModel
    
    var body: some View {
        VStack(alignment:.center,spacing: 20) {
            Text("Succesfully Taken")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.mainHeadingText)
            VStack(alignment:.leading,spacing: 10) {
                Text("remaining Dosages: \(medicine.count)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primaryText)
                   
                Text("Remaing Days: \(medicine.days)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primaryText)
            }
            
            okButton
        }
        .padding()
        .frame(maxWidth:300)
        .background(Color.alertBackground)
        .cornerRadius(20)
        .shadow(radius: 10,x:5,y:5)
        .transition(.scale)
    }
    
    var okButton: some View {
        Button(action: {
            withAnimation {
                alertIsVisible = false
            }
        }) {
            Text("OK")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(width:120)
                .background(Color.btnColor)
                .cornerRadius(10)
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(alertIsVisible: .constant(true), medicine: MedicineViewModel(medicine: Medicine(context: CoreDataManager.shared.viewContext)))
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
