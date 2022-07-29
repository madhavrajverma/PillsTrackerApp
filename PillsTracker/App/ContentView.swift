//
//  ContentView.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MedicineListScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
            
            MedicineHistoryScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "note.text")
                        Text("History")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
