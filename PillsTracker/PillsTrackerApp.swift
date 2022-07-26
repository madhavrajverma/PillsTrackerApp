//
//  PillsTrackerApp.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import SwiftUI

@main
struct PillsTrackerApp: App {
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    NotificationManager.instances.requestAuthroization()
                }
        }.onChange(of: scenePhase) { _ in
            CoreDataManager.shared.save()
        }
    }
}
