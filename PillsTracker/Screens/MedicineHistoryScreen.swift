//
//  MedicineHistoryScreen.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//

import SwiftUI

struct MedicineHistoryScreen: View {
    @StateObject var historyVM = HistoryListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(historyVM.history,id:\.historyId) { history in
                        Text(history.name)
                    }.onDelete(perform: deleteHistory)
                }.onAppear {
                    historyVM.fetchAllHistory()
                }
                
            }.navigationTitle("History")
        }
    }
    
    private func deleteHistory(at indexSet:IndexSet) {
        indexSet.forEach { index in
            let history  = historyVM.history[index]
            historyVM.deleteHistory(historyVM: history)
            historyVM.fetchAllHistory()
        }
    }
}

struct MedicineHistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        MedicineHistoryScreen()
    }
}
