//
//  Home.swift
//  M4Exercise
//
//  Created by nato on 10/08/25.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    var body: some View {
        HStack(spacing: 15){
            LittleLemonLogo()
            Image("profile-image-placeholder").resizable().frame(width: 50,height: 50)                                .cornerRadius(50)
        }
        TabView {

            MenuScreen().tabItem {
                Label("Menu", systemImage: "list.dash")
            } .environment(\.managedObjectContext, persistence.container.viewContext)
                .navigationBarBackButtonHidden(true)
            UserProfile().tabItem {
                Label("Profile", systemImage: "square.and.pencil")
            }
        }

    }
}

#Preview {
    Home()
}
