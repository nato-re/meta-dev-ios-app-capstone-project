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
    @State var showAlert = false
    @State var isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                NavigationLink(
                    destination: Home(),
                    isActive: $isLoggedIn,
                    label: { EmptyView() }
                )
                Hero()
                VStack(alignment: .leading) {
                    Text("First Name")
                        .font(.subheadline)
                    TextField("First Name", text: $firstName)
                    Text("Last Name")
                        .font(.subheadline)
                    TextField("Last Name", text: $lastName)
                    Text("Email")
                        .font(.subheadline)
                    TextField("Email", text: $email).keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }
                Button("Next") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty
                    {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    } else {
                        showAlert = true
                    }
                }.padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
            }.padding()

        }.onAppear {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            }
        }.alert(isPresented: $showAlert) {
            Alert(
                title: Text("Missing Information"),
                message: Text("Please fill in all the fields."),
                dismissButton: .default(Text("OK"))
            )
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
