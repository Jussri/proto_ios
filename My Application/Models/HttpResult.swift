//
//  HttpResult.swift
//  My Application
//
//  Created by Jussi Rinta-Kiikka on 10.5.2023.
//

import Foundation

/// Represents the result of an http request, that contains an array of person objects
struct HttpResult: Decodable {
    let users: Array<Person>
}
