//
//  AddMedicineScreen.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import SwiftUI

struct AddMedicineScreen: View {
    @StateObject var addMedicineVM = AddMedicineViewModel()
    @Environment(\.presentationMode) var presentaionMode
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("name", text: $addMedicineVM.name)
                        .disableAutocorrection(true)
                    TextField("Desc Eg: 1 tablet a day",text: $addMedicineVM.description)
                    TextField("Home Many Days",text: $addMedicineVM.days)
                    
                    Picker("Frequency",selection: $addMedicineVM.frequency) {
                        ForEach(Frequency.allCases,id:\.self) { freq in
                            Text(freq.rawValue)
                        }
                    }
                    Picker("Select Type", selection: $addMedicineVM.type) {
                        ForEach(MedicineType.allCases,id:\.self) { medicine in
                            Text(medicine.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if addMedicineVM.frequency == .once {
                        DatePicker("Select time", selection: $addMedicineVM.intake,displayedComponents: .hourAndMinute)
                    } else if addMedicineVM.frequency == .twice {
                        VStack {
                            DatePicker("First Intake", selection: $addMedicineVM.intake1,displayedComponents: .hourAndMinute)
                            
                            DatePicker("Second Intake", selection: $addMedicineVM.intake2,displayedComponents: .hourAndMinute)
                        }
                    }
                }
                Button(action: {
                    addMedicineVM.saveMedicine()
                    presentaionMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.orange)
                }
            }.navigationTitle("Add Medcine")
        }
    }
}

struct AddMedicineScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMedicineScreen()
    }
}
