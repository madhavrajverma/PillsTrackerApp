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
            ScrollView {
                VStack(alignment:.center,spacing: 10) {
                    PTTextField(text: $addMedicineVM.name, placeholder: "Name of Medicine")
                    PTTextField(text: $addMedicineVM.description, placeholder: "Description eg: two times a day")
                    PTTextField(text: $addMedicineVM.dosages, placeholder: "Dosages eg: 4g")
                        .keyboardType(.numberPad)
                    PTTextField(text: $addMedicineVM.days, placeholder: "How Many Days eg:7")
                        .keyboardType(.numberPad)
                }
                
                HStack {
                    Text("Medicine Type:")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                
                HStack() {
                    ForEach(MedicineType.allCases,id:\.self) { type in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(type == addMedicineVM.type ? Color.btnColor : .clear)
                                .frame(width:56,height: 56)
                            Image(type.imageIcon)
                        }
                        .padding(.horizontal)
                        .onTapGesture {
                            addMedicineVM.type = type
                        }
                    }
                }
                
                HStack {
                    Text("Frequency:")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                
                Picker("Frequency",selection: $addMedicineVM.frequency) {
                    ForEach(Frequency.allCases,id:\.self) { freq in
                        Text(freq.rawValue)
                    }
                }.pickerStyle(.segmented)
                    .padding(.horizontal)
              
                if addMedicineVM.frequency == .once {
                    DatePicker("Select time", selection: $addMedicineVM.intake,displayedComponents: .hourAndMinute)
                        .padding()
                } else if addMedicineVM.frequency == .twice {
                    VStack(spacing:16) {
                        DatePicker("First Intake", selection: $addMedicineVM.intake1,displayedComponents: .hourAndMinute)
                            .padding(.horizontal)
                        
                        DatePicker("Second Intake", selection: $addMedicineVM.intake2,displayedComponents: .hourAndMinute)
                            .padding(.horizontal)
                    }.padding(.top,10)
                }
                
                Button(action: {
                    addMedicineVM.saveMedicine()
                    presentaionMode.wrappedValue.dismiss()
                }) {
                    Text("Add Medicine")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth:.infinity)
                        .background(Color.btnColor.cornerRadius(10))
                        .padding()
                    
                }.disabled(addMedicineVM.name.isEmpty || addMedicineVM.dosages.isEmpty||addMedicineVM.days.isEmpty||addMedicineVM.description.isEmpty)
                
                
            }
            .navigationTitle("Add new Medicine")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddMedicineScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMedicineScreen()
    }
}


/*
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

*/
