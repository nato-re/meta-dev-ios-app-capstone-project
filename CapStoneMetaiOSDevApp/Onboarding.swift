//  SwiftUIView.swift
//  M4Exercise
//
//  Created by nato on 10/08/25.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "first name key"
let kEmail = "first name key"
let kIsLoggedIn = "kIsLoggedIn"

struct OnboardingScreen: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: Home(),
                            isActive: $isLoggedIn,
                            label: { EmptyView() }
                        )
                        
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email).keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                Button("Next") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        print("test")
                        isLoggedIn = true

                    }
                }.padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
            }

 
        }.onAppear {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    OnboardingScreen()
}

//
//  SwiftUIView.swift
//  M4Exercise
//
//  Created by nato on 10/08/25.
//

//import SwiftUI
//
//let kFirstName = "first name key"
//let kLastName = "first name key"
//let kEmail = "first name key"



//struct OnboardingScreen: View {
//    @State var firstName = ""
//    @State var lastName = ""
//    @State var email = ""
//    @State var isLoggedIn = false
//    var body: some View {
//        NavigationView {
//            VStack{
//                NavigationLink(destination: Home(), isActive: $isLoggedIn){
//                    EmptyView()
//                }
//                TextField("First Name", text: $firstName)
//                TextField("Last Name", text: $lastName)
//                TextField("Email", text: $email)
//            }
//
//        }
//                
//        Button("Register"){
//            if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
//                UserDefaults.standard.set(firstName, forKey: kFirstName)
//                UserDefaults.standard.set(lastName, forKey: kLastName)
//                UserDefaults.standard.set(email, forKey: kEmail)
//
//            }
//        }
//
//    }
//}
//
//#Preview {
//    OnboardingScreen()
//}
//
