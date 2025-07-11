
import SwiftUI
import SwiftData

@main
struct RunovaApp: App {
    
    var modelContainer : ModelContainer {
        let modelContainer = try! ModelContainer(for: UserData.self, HistoryComponent.self, AppState.self)
        return modelContainer
    }
    
    var body: some Scene {
        WindowGroup {
            TampilanAwal()
            
        }
        
        .modelContainer(modelContainer)
    }
}
