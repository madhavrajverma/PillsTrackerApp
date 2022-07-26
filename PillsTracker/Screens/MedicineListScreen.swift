//
//  MedicineListScreen.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import SwiftUI

struct MedicineListScreen: View {
    @State private var addMedicineScreen: Bool = false
    @StateObject var medicineListVM =  MedicineListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(medicineListVM.medicines,id:\.medicineId) { medicine in
                    NavigationLink(destination: MedicineDetailScreen(medicineListVM: medicineListVM, medicine: medicine)) {
                        Text(medicine.name)
                    }
                }.onDelete(perform: deleteMedicine)
                    
            }
            .sheet(isPresented: $addMedicineScreen,onDismiss: {
                medicineListVM.fetchAllMedicines()
            }, content: {
                AddMedicineScreen()
            })
            .navigationTitle("Medicines")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {addMedicineScreen = true}) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.orange)
                    }
                }
            }
            .onAppear {
                medicineListVM.fetchAllMedicines()
              
            }
        }
    }
    
    private func deleteMedicine(at indexSet:IndexSet) {
        indexSet.forEach { index in
            let medicine = medicineListVM.medicines[index]
            medicineListVM.deleteMedecine(medVM: medicine)
            medicineListVM.fetchAllMedicines()
        }
    }
}

struct MedicineListScreen_Previews: PreviewProvider {
   
       
    static var previews: some View {
        MedicineListScreen()
    }
}
