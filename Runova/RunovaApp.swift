//
//  RunovaApp.swift
//  Runova
//
//  Created by Foundation-026 on 18/06/25.
//

import SwiftUI
import SwiftData

@main
struct RunovaApp: App {
    
    var modelContainer : ModelContainer {
        let modelContainer = try! ModelContainer(for: UserData.self, HistoryComponent.self, AppState.self)
        return modelContainer
    }
    
    //@AppStorage("userDataDidSet") var userDataDidSet: Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            TampilanAwal()
            
        }
        
        .modelContainer(modelContainer)
    }
}
