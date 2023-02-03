//
//  UserFavouriteModel.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 2/2/23.
//

import Foundation

struct UserFavourite : Identifiable {
    let id = UUID()
    let userId: String
    let dishName: String
}
