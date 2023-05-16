//
//  Connection.swift
//  My Application
//
//  Created by Jussi Rinta-Kiikka on 16.5.2023.
//

import Foundation

//Handles the HTTP connection to the API and retrieves the data
class HttpConnection: ObservableObject {

    //Result array of the people retrieved from the API
    @Published var result: Array<Person> = []

    var myURL: URL {
        URL(string: "https://dummyjson.com/users")!
    }

    // Method connects to the API and retrieves the data
    func connect() {
        let httpTask = URLSession.shared.dataTask(with: myURL) { (optionalData, response, error) in

            // Decodes data retrieved from the API into an HttpResult object
            let jsonDecoder = JSONDecoder()
            DispatchQueue.main.async () {
                do {
                    let httpResult = try jsonDecoder.decode(HttpResult.self, from: optionalData!)

                    //Sets result array to the users retrieved from the HttpResult object
                    self.result = httpResult.users

                } catch {
                    print(error)
                }
            }
        }
        httpTask.resume()
    }
}
