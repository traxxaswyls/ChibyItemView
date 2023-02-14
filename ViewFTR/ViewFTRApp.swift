//
//  ViewFTRApp.swift
//  ViewFTR
//
//  Created by Kazakh on 13.02.2023.
//

import SwiftUI

@main
struct ViewFTRApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
