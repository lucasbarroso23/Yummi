//
//  ApiResponse.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 21/11/2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
