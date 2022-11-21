//
//  NetworkService.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 21/11/2022.
//

import Foundation

struct NetworkService {
    
    /// this functions works as a wrapper to generate UrlRequets
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: type of request to be made, should be a http verb
    ///   - parameters: whatever extra information you need to pass to the backend as a dictionary of key string and value Any
    /// - Returns: URLRequest
    func createRequest(
        route: Route,
        method: Method,
        parameters: [String: Any]? = nil) -> URLRequest? {
            let  urlString = Route.baseUrl + route.description
            guard let url = urlString.asUrl else {return nil}
            var urlRequest = URLRequest(url: url)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpMethod = method.rawValue
            
            if let params = parameters {
                switch method {
                case .get:
                    var urlComponents = URLComponents(string: urlString)
                    urlComponents?.queryItems = params.map {URLQueryItem(name: $0, value: "\($1)")}
                    urlRequest.url = urlComponents?.url
                case .post, .delete, .patch:
                    let bodyData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                    urlRequest.httpBody = bodyData
                }
            }
            return urlRequest
        }
}
