//
//  ContentView.swift
//  My Application
//
//  Created by Jussi Rinta-Kiikka on 10.5.2023.
//

import SwiftUI

//Main view that shows a list of people fetched from API
struct ContentView: View {
    @StateObject var httpConnection = HttpConnection()
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var userAddedMessage = false
    @State private var emptyFormMessage = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Dummy JSON API 👤")
                    .font(.title)

                List {

                    //Retrieves people fetched from the httpConnection object
                    let people = httpConnection.result

                    //Loops through people retrieved and creates a view for each person
                    ForEach(people, id: \.id) { person in
                            Text("\(person.firstName) \(person.lastName)")
                                .font(.headline)
                                .padding()
                    }
                }

                Group{
                    Form {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)

                        Button(action: {

                            //Checks if fields are empty
                            if firstName.isEmpty || lastName.isEmpty {
                                emptyFormMessage = true

                                //Delay to hide the alert emptyFormMessage
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    emptyFormMessage = false
                        }
                            } else {
                                userAddedMessage = true
                                firstName = ""
                                lastName = ""

                                //Delay to hide the alert userAddedMessage
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    userAddedMessage = false
                                }
                            }
                        }) {
                            Text("Add User")
                            }

                            if emptyFormMessage {
                                Text("Please fill out form!")
                                    .foregroundColor(.red)
                            }

                            if userAddedMessage {
                                Text("User added!")
                                    .foregroundColor(.green)
                        }
                    }
                    .frame(height: 200)
                }
            }
        }
        .onAppear {
            httpConnection.connect()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

}
