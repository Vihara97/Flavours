//
//  DishModel.swift
//  Flavours
//
//  Created by Vihara Karunarathna on 1/27/23.
//

import Foundation

enum Category: String {
    case breakfast = "Breakfast"
    case soup = "Soup"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case drink = "Drink"
}

struct Dish : Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let noOfCalories: String
    let dishCategory: Category.RawValue
    
    
}
