//
//  Dish.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 16/11/2022.
//

import Foundation

struct Dish {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories) calories"
    }
}
