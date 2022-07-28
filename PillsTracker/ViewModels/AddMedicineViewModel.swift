//
//  AddMedicineViewModel.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import Foundation
import Combine
import SwiftUI


enum MedicineType:String,CaseIterable {
    case tablet = "Tablet"
    case capsule = "Capsule"
    case syrup = "Syrup"
    case injection = "Injection"
    
    var imageIcon:String {
        switch self {
        case .tablet:
            return Constants.tabletIcon.rawValue
        case .capsule:
            return   Constants.capsuleIcon.rawValue
        case .syrup:
            return  Constants.syrupIcon.rawValue
        case .injection:
            return Constants.injectionIcon.rawValue
        }
    }
   
    var image:String {
        switch self {
        case .tablet:
            return Constants.tabletImage.rawValue
        case .capsule:
            return   Constants.capsuleImage.rawValue
        case .syrup:
            return  Constants.syrupImage.rawValue
        case .injection:
            return Constants.injectionImage.rawValue
        }
    }
    
    var background:Color {
        switch self {
        case .tablet:
            return Color.tabletBackground
        case .capsule:
            return  Color.capsuleBackground
        case .syrup:
            return  Color.syrupBackground
        case .injection:
            return Color.injectionBackground
        }
    }
}

enum Frequency: String , CaseIterable {
    case once = "Once In a Day"
    case twice = "Twice in A day"
}


class AddMedicineViewModel : ObservableObject {
    
    @Published var name:String = ""
    @Published var days:String = ""
    @Published var description:String = ""
    @Published var dosages:String = ""
    @Published var frequency: Frequency = .once
    @Published var type:MedicineType = .tablet
    
    
    // For Disabling Button
    
    @Published var isNameValid:String = ""
    @Published var isDaysValid:String = ""
    @Published var isDescriptionValid:String = ""
    @Published var isDosagesValid:String = ""
    
    @Published var addButtonDisbaled = false
    // For Intakes
    @Published var intake:Date = Date()
    @Published var intake1:Date = Date()
    @Published var intake2:Date = Date()
    
    private var cancellableSet: Set<AnyCancellable> = []
    
//    if !name.isEmpty && !days.isEmpty && !description.isEmpty && !dosages.isEmpty {
//        return false
//    }
//    return true
    
    
    var intaksArray:[Date] = []
    
    func saveMedicine() {
        
        let medicine = Medicine(context: CoreDataManager.shared.viewContext)
        let medicineId = UUID().uuidString
        medicine.name = name
        medicine.medicineId = medicineId
        medicine.days = Int16(days) ?? 0
        medicine.medicineType = type
        medicine.desc = description
        medicine.frequency = frequency
        medicine.dosages = dosages
        
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
                    await NotificationManager.instances.scheduleNotifications(medicine: medicine, intakes: self.intaksArray,medicineId:medicineId)
                }
            }
        }
     
      
      
    }
    
}
