//
//  FrontView.swift
//  My Application
//
//  Created by Jussi Rinta-Kiikka on 10.5.2023.
//

import Foundation

import SwiftUI
 
struct FrontView: View {
    var body: some View {
        VStack {
            Text("Welcome to my app!")
                .font(.title)
                .padding()
            Button(action: {
                // Navigate to ContentView
                NavigationLink(destination: ContentView()) {
                    Text("Enter")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }) {
                EmptyView()
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
 
struct FrontView_Previews: PreviewProvider {
    static var previews: some View {
        FrontView()
    }
}
