//
//  HistoryListViewModel.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//

import Foundation
import CoreData

class HistoryListViewModel:ObservableObject {
    
    @Published var history:[HistoryViewModel] = []
    
    func fetchAllHistory() {
        DispatchQueue.main.async {
            self.history = History.getAllHistory().map(HistoryViewModel.init)
        }
    }
    func deleteHistory(historyVM:HistoryViewModel) {
        let history  = History.historyById(id: historyVM.historyId)
        if let history = history {
            History.delete(history: history)
        }
    }
}

struct HistoryViewModel  {
    let history :History
    
    var historyId: NSManagedObjectID {
        return history.objectID
    }
    
    var name:String  {
        return history.name ?? ""
    }
    
    var days : Int {
        return Int(history.days)
    }
    
    
    var desc:String {
        return history.desc ?? ""
    }
    
    var count : String {
        return String(describing: history.count)
    }
    var type:MedicineType {
        return history.medicineType
    }
    
}
