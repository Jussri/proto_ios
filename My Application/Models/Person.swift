//
//  Person.swift
//  My Application
//
//  Created by Jussi Rinta-Kiikka on 10.5.2023.
//

import Foundation

struct Person: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
}
