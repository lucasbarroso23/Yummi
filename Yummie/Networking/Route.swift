//
//  Route.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 21/11/2022.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    
    var description: String {
        switch self {
        case .temp: return "/temp"
        }
    }
}
