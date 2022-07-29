//
//  MedicineDetailScreenView.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 28/07/22.
//

import SwiftUI

struct MedicineDetailScreenView: View {
    @State private var alertVisible:Bool = false
    
    @ObservedObject var medicineListVM : MedicineListViewModel
    @StateObject var addHistoryVM = AddHistoryViewModel()
    @ObservedObject var notficationVM:  NotificationListViewModel
    let medicine:MedicineViewModel
    
    var body: some View {
        ZStack(alignment:.center) {
            if alertVisible  {
                CustomAlertView(alertIsVisible: $alertVisible,medicine:medicine)
                    .transition(.scale)
            }
            else {
                ScrollView {
                    VStack(alignment:.leading,spacing: 40) {
                        HStack(alignment:.center,spacing: 10){
                            Image(Constants.capsuleImage.rawValue)
                                .resizable()
                                .frame(width:120,height: 120)
                                .padding(.horizontal)
                            VStack(alignment:.leading,spacing: 20) {
                                MedicineTextDetailView(title: "Pill Name", subtitle: "\(medicine.name)")
                                MedicineTextDetailView(title: "Pill Dosage", subtitle: "\(medicine.dosages)")
                                MedicineTextDetailView(title: "Pills Type", subtitle: "\(medicine.type.rawValue)")
                            }
                        }
                        
                        VStack(alignment:.leading,spacing: 20) {
                            
                            MedicineTextDetailView2(title: "Description:", subtitle: "\(medicine.desc)")
                            
                            VStack(alignment:.leading,spacing: 10) {
                                Text("Frequency")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black.opacity(0.8))
                                
                                HStack {
                                    Text("\(medicine.freq.rawValue): Time:")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.primaryText)
                                    
                                    ForEach(medicineListVM.intakes,id:\.intakeId) {
                                        intake in
                                        HStack(spacing:6) {
                                            Text("\(intake.time):")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.primaryText)
                                        }
                                    }
                                }
                            }
                            
                            HStack {
                                MedicineTextDetailView2(title: "Program:", subtitle: "Days: \(medicine.days)")
                                Spacer()
                                MedicineTextDetailView2(title: "Dosages:", subtitle: "\(medicine.dosages)")
                            }
                          
                            HStack {
                                
                                takePillButton
                                Spacer()
                                deleteButton
                                
                            }
                            .padding()
                          
                        }  .padding(.horizontal)
                    }  .padding(.horizontal)
                }.transition(.opacity)
                    .onAppear {
                        medicineListVM.fetchAllIntakes(medicine: medicine)
                        notficationVM.fetchAllNotfications(medVM: medicine)
                }
                
            }
        }
    }
    
    // Methods: 
    var takePillButton: some View {
        
        Button(action: {
            
            var med:MedicineViewModel
            if Int(medicine.count)!  == 1 {
                med = medicine
                notficationVM.fetchAllNotfications(medVM: medicine)
                notficationVM.deleteAllNotification()
                medicineListVM.deleteMedecine(medVM: medicine)
                addHistoryVM.saveHistory(medVM: med)
            } else {
                medicineListVM.updateDosageAndDays(medVM: medicine)
                addHistoryVM.saveHistory(medVM: medicine)
            }
            
            medicineListVM.fetchAllMedicines()
            
            withAnimation{
                alertVisible = true
            }
            
        }) {
            Text("Take Pill")
                .fontWeight(.bold)
                .modifier(ButtonViewModifier(btnColor: Color.btnColor))
        }.disabled(Int(medicine.count)! < 0)
    }
    
    var deleteButton: some View {
        Button(action: {
            notficationVM.fetchAllNotfications(medVM: medicine)
            notficationVM.deleteAllNotification()
            medicineListVM.deleteMedecine(medVM: medicine)
            medicineListVM.fetchAllMedicines()
        }) {
            Text("Delete")
                .fontWeight(.bold)
                .modifier(ButtonViewModifier(btnColor: Color.btnDelete))
        }
    }
}

struct MedicineDetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineDetailScreenView(medicineListVM: MedicineListViewModel(), notficationVM: NotificationListViewModel(), medicine: MedicineViewModel(medicine: Medicine(context: CoreDataManager.shared.viewContext)))
    }
}
