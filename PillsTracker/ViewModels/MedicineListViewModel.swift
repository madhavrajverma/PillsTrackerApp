//
//  MedicineListViewModel.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import Foundation
import CoreData

class MedicineListViewModel: ObservableObject {
    @Published var medicines: [MedicineViewModel] = []
    @Published var intakes : [IntakeViewModel] = []
    func fetchAllMedicines() {
        DispatchQueue.main.async {
            self.medicines = Medicine.getAllMedicines().map(MedicineViewModel.init)
        }
    }
    
    func fetchAllIntakes(medicine:MedicineViewModel) {
        DispatchQueue.main.async {
            self.intakes = Intake.getIntakeByMedicineId(medicineId: medicine.medicineId).map(IntakeViewModel.init)
        }
    }
    
    func updateDosageAndDays(medVM:MedicineViewModel) {
        
        let medicien = Medicine.medicineById(id: medVM.medicineId)
        
        let count = Int(medVM.count)
        let freq:Frequency = medVM.freq
        
        guard let count = count else {
            return
        }
        
        let dosagesCount =  Int16(count) - 1
        
        medicien?.count = dosagesCount
        
        if freq == .once {
            medicien?.days = Int16(Int(round(Double(dosagesCount / 1))))
        }else if freq == .twice {
            medicien?.days = Int16(Int(round(Double(dosagesCount / 2))))
        }
        
       
        
        Medicine.save()
    }
    
    func deleteMedecine(medVM:MedicineViewModel) {
            let medicine  = Medicine.medicineById(id: medVM.medicineId)
            if let medicine = medicine {
                Medicine.delete(medicine: medicine)
         }
        
    }
}

struct MedicineViewModel {
    let medicine :Medicine
    
    var medicineId: NSManagedObjectID {
        return medicine.objectID
    }
    
    var name:String  {
        return medicine.name ?? ""
    }
    
    var days : Int {
        return Int(medicine.days)
    }
    
    var type:MedicineType {
        return medicine.medicineType
    }
    
    var desc:String {
        return medicine.desc ?? ""
    }
    
    var count : String {
        return String(describing: medicine.count)
    }
    
    var freq:Frequency {
        return medicine.frequency
    }
}


struct IntakeViewModel  {
    let intake:Intake
    
    var intakeId: NSManagedObjectID {
        return intake.objectID
    }
    
    var time: String {
        return intake.time?.asFormattedString() ?? Date().asFormattedString()
    }
}
