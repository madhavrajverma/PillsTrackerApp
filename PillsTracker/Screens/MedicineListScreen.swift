//
//  MedicineListScreen.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import SwiftUI

struct MedicineListScreen: View {
    @State private var addMedicineScreen: Bool = false
    @StateObject var notficationVM = NotificationListViewModel()
    @StateObject var medicineListVM =  MedicineListViewModel()
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment:.bottomTrailing) {
                ScrollView(.vertical,showsIndicators: false) {
                    VStack {
                         HomeHeaderView()
                        
                        HStack {
                            Text("Your Medicines")
                                .bold()
                                .font(.title2)
                                Spacer()
                        }
                        .padding()
                        
                        if medicineListVM.medicines.isEmpty {
                            EmptyStateView(title: "No Medicine Found", subtitle: "Add New Medicine")
                                .padding(.vertical)
                        } else {
                            ForEach(medicineListVM.medicines,id:\.medicineId) { medicine  in
                                NavigationLink(destination: MedicineDetailScreenView(medicineListVM: medicineListVM, notficationVM: notficationVM,medicine: medicine)) {
                                    MedicineRowView(medicine: medicine)
                                }
                            }
                        }
                                
                        
                    }
                }
                    .padding()
                Button(action:{
                    addMedicineScreen = true
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 32, height: 32)
                        .padding()
                }.background(Color.btnColor)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding()
                
            }
            
            .sheet(isPresented: $addMedicineScreen,onDismiss: {
                medicineListVM.fetchAllMedicines()
            }, content: {
                AddMedicineScreen()
            })
            .navigationTitle("MedTake")
            .onAppear {
                medicineListVM.fetchAllMedicines()
                NotificationManager.instances.removeAllDelviredNotification()
                NotificationManager.instances.getAllPendingNotification()
            }
        }
    }
}

struct MedicineListScreen_Previews: PreviewProvider {
   
       
    static var previews: some View {
        MedicineListScreen()
    }
}

