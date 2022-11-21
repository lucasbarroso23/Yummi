//
//  AppError.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 21/11/2022.
//

import Foundation

// AppError will work as our errors model
enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Unknown error"
        case .invalidUrl:
            return "Invalid Url"
        case .serverError(let error):
            return error
        }
    }
}
