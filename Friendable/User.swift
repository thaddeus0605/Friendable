//
//  User.swift
//  Friendable
//
//  Created by Thaddeus Dronski on 1/9/23.
//

import Foundation


struct User: Codable, Identifiable {
    let id: UUID
    let name: String
    let age: Int
    let isActive: Bool
    let company: String
    let email: String
    let address: String
    let about: String
    let tags: [String]
    let friends: [Friend]
    
    static let example = User(id: UUID(), name: "Alford Rodriguez", age: 25, isActive: true, company: "Apple", email: "NOREPLY@gmail.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", tags: ["cilum", "consequat", "deserunt", "nostrud"], friends: [])
}


struct Friend: Identifiable, Codable {
    let id: UUID
    let name: String
}
