//
//  MedicineDetailScreen.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//

import SwiftUI

struct MedicineDetailScreen: View {
    @ObservedObject var medicineListVM : MedicineListViewModel
    @StateObject var addHistoryVM = AddHistoryViewModel()
    @ObservedObject var notficationVM:  NotificationListViewModel
    let medicine:MedicineViewModel
    var body: some View {
        VStack {
            Form {
                Text("Name: \(medicine.name)")
                    .font(.title)
                Text("Description \(medicine.desc)")
                Text("Remaining Days: \(String(describing: medicine.days))")
                Text("Remaining Dosages: \(String(describing: medicine.count))")
                Text("MedicineType : \(medicine.type.rawValue)")
                Text("Frequency : \(medicine.freq.rawValue)")
               
                ForEach(medicineListVM.intakes,id:\.intakeId) {
                    intake in
                    Text("Intake Time: \(intake.time)")
                }
                
                VStack {
                    Text("Notification ")
                    ForEach(notficationVM.notifcations,id:\.notifcationID) { notification in
                        Text("NotificationID : \(notification.notifcationID)")
                        Text("MedicineID : \(notification.medicineId)")
                    }
                }
            }
            
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
                
                
                
            }) {
                Text("Take")
                    .font(.headline)
                    .foregroundColor(.orange)
            }.disabled(Int(medicine.count)! < 0)
        }
        .onAppear {
            medicineListVM.fetchAllIntakes(medicine: medicine)
            notficationVM.fetchAllNotfications(medVM: medicine)
    }
    }
}

struct MedicineDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MedicineDetailScreen(medicineListVM: MedicineListViewModel(), notficationVM: NotificationListViewModel(), medicine: MedicineViewModel(medicine: Medicine(context: CoreDataManager.shared.viewContext)))
    }
}


