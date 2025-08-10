import SwiftUI
import CoreData

struct MainView: View {
    let persistenceController = PersistenceController.shared

    
    
    var body: some View {
        
        OnboardingScreen().environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}

#Preview {
    MainView()
}



