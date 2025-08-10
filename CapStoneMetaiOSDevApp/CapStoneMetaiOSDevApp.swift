import SwiftUI

@main
struct CapStoneMetaiOSDevApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
