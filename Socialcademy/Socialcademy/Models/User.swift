//
//  User.swift
//  Socialcademy
//
//  Created by Robert Bates on 12/10/22.
//

import Foundation

struct User: Identifiable, Equatable, Codable {
    var id: String
    var name: String
}

extension User {
    static let testUser = User(id: "", name: "Jamie Harris")
}

