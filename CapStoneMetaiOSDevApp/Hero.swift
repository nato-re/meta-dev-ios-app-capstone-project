//
//  Hero.swift
//  CapStoneMetaiOSDevApp
//
//  Created by nato on 10/08/25.
//
import SwiftUI

struct Hero: View {
    var body: some View {
        VStack {
            HStack (){
                VStack(alignment: .leading) {
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .padding(.top)
                    Text("Chicago")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Text(
                        "We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist."
                    )
                    .multilineTextAlignment(.leading)
                }
                Image("Hero")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)

                
            }.padding()
        }
    }
}

#Preview{
    Hero()
}
