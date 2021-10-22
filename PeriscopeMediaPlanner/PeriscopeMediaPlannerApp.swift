//
//  PeriscopeMediaPlannerApp.swift
//  PeriscopeMediaPlanner
//
//  Created by Andrei Kamarou on 22.10.21.
//

import SwiftUI

@main
struct PeriscopeMediaPlannerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
