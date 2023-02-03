//
//  UserModel.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 2/2/23.
//

import Foundation

struct User : Identifiable {
    let id = UUID()
    let email: String
    let password: String
    let confirmPassword: String
    
}
