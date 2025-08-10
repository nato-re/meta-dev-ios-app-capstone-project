//
//  UserProfile.swift
//  M4Exercise
//
//  Created by nato on 10/08/25.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Text("First Name: \(firstName)")
                .font(.headline)
            
            // Display the user's last name
            Text("Last Name: \(lastName)")
                .font(.headline)
            
            // Display the user's email
            Text("Email: \(email)")
                .font(.headline)
            Button("Logout") {
                           // Set login status to false in UserDefaults
                           UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                           // Dismiss the current view to go back to the Onboarding screen
                           self.presentationMode.wrappedValue.dismiss()
                       }
                       .padding()
                       .background(Color.yellow)
                       .foregroundColor(.black).bold()
                       .cornerRadius(10)
            Spacer()

        }
    }
}

#Preview {
    UserProfile()
}
