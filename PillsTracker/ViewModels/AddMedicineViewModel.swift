//
//  AddMedicineViewModel.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import Foundation


enum MedicineType:String,CaseIterable {
    case tablet = "Tablet"
    case capsule = "Capsule"
    case syrup = "Syrup"
    case injection = "Injection"
   
}

enum Frequency: String , CaseIterable {
    case once = "Once In a Day"
    case twice = "Twice in A day"
}


class AddMedicineViewModel : ObservableObject {
    
    @Published var name:String = ""
    @Published var days:String = ""
    @Published var description:String = ""
    @Published var frequency: Frequency = .once
    @Published var type:MedicineType = .tablet
    
    // For Intakes
    @Published var intake:Date = Date()
    @Published var intake1:Date = Date()
    @Published var intake2:Date = Date()
    
    var intaksArray:[Date] = []
    
    func saveMedicine() {
        
        let medicine = Medicine(context: CoreDataManager.shared.viewContext)
        medicine.name = name
        medicine.days = Int16(days) ?? 0
        medicine.medicineType = type
        medicine.desc = description
        medicine.frequency = frequency
        
        if frequency == .once {
            let take = Intake(context: CoreDataManager.shared.viewContext)
            take.time = intake
            let count = (Int16(days) ?? 0) * 1
            medicine.count = Int16(count)
            medicine.addToIntakes(take)
            
        } else if frequency == .twice {
            let take1 = Intake(context: CoreDataManager.shared.viewContext)
            take1.time = intake1
            
            let count = (Int16(days) ?? 0) * 2
            medicine.count = Int16(count)
            
            let take2 = Intake(context: CoreDataManager.shared.viewContext)
            take2.time = intake2
            
            medicine.addToIntakes(take1)
            medicine.addToIntakes(take2)
        }
        
        Medicine.save {
            Task {
                let authorize = await NotificationManager.instances.isAuthorizeForNotification()
              
                if authorize {
                    if self.frequency == .once {
                        self.intaksArray.append(self.intake)
                    }else if self.frequency == .twice {
                        self.intaksArray.append(self.intake1)
                        self.intaksArray.append(self.intake2)
                    }
                    await NotificationManager.instances.scheduleNotifications(medicine: medicine, intakes: self.intaksArray)
                }
            }
        }
     
      
      
    }
    
}
