//
//  TrialApp.swift
//  Trial
//
//  Created by Developer on 3/4/23.
//

import SwiftUI

@main
struct TrialApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
