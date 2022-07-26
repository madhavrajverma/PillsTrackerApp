//
//  NotficationListViewModel.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 27/07/22.
//

import Foundation


class NotificationListViewModel :ObservableObject {

    @Published var notifcations:[NotificationViewModel] = []
     
    func fetchAllNotfications(medVM:MedicineViewModel) {
        self.notifcations = NotificationModel.fetchAllNotifications(id: medVM.medicineId).map(NotificationViewModel.init)
        print(self.notifcations)
    }
    
    func deleteAllNotification() {
        let id:[String] = notifcations.map { $0.notifcationID }
        NotificationManager.instances.removeNotifciationWithId(id: id)
    }
    
}



struct NotificationViewModel {
    let notification:NotificationModel
    
    var notifcationID: String {
        return notification.notificationId ?? ""
    }
    
    var medicineId:String {
        return notification.medicineId ?? ""
    }
}
