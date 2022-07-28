//
//  MedicineHistoryScreen.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//

import SwiftUI

struct MedicineHistoryScreen: View {
    
    @StateObject var historyVM = HistoryListViewModel()
  
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
       ]
    var body: some View {
        NavigationView {
            VStack {
                if historyVM.history.isEmpty {
                    EmptyStateView(title: "No History Found", subtitle: "Take Medicine On time")
                }else {
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                            ForEach(historyVM.history,id:\.historyId) { history in
                              MedicineHistoryRowView(history: history)
                                    .contextMenu {
                                        Button(role: .destructive) {
                                            deleteHistory(history: history)
                                        } label: {
                                           Label("Delete", systemImage: "trash")
                                        }

                                    }
                            }
                        }
                    }
                    .padding(.horizontal)
//                    List {
//                        ForEach(historyVM.history,id:\.historyId) { history in
//                            Text(history.name)
//                        }.onDelete(perform: deleteHistory)
//                    }
                }
            }.navigationTitle("History")
                .onAppear {
                       historyVM.fetchAllHistory()
                   }
        }
    }
    
    func deleteHistory(history:HistoryViewModel) {
        historyVM.deleteHistory(historyVM:history)
        historyVM.fetchAllHistory()
    }
    
//    private func deleteHistory(at indexSet:IndexSet) {
//        indexSet.forEach { index in
//            let history  = historyVM.history[index]
//            historyVM.deleteHistory(historyVM: history)
//            historyVM.fetchAllHistory()
//        }
//    }
}

struct MedicineHistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        MedicineHistoryScreen()
    }
}
