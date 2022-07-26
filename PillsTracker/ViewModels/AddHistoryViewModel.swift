//
//  AddHistoryViewModel.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//

import Foundation
import CoreData

class AddHistoryViewModel:ObservableObject {
   
    func saveHistory(medVM:MedicineViewModel) {
        let history = History(context:CoreDataManager.shared.viewContext)
        history.name = medVM.name
        history.desc  = medVM.desc
        history.count = Int16(medVM.count) ?? 0
        history.days = Int16(medVM.days)
        history.date = Date()
        History.save()
    }
    
}


