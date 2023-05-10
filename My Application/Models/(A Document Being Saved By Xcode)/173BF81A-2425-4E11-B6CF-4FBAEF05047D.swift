//
//  HttpResult.swift
//  My Application
//
//  Created by Jussi Rinta-Kiikka on 10.5.2023.
//

import Foundation
struct HttpResult: Decodable {
    var users: Array<Person>
}
