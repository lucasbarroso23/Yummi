//
//  NetworkService.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 21/11/2022.
//

import Foundation

struct NetworkService {
    
    // singleton instance pattern
    static let shared = NetworkService()
    
    // avoiding init calls
    private init() {}
    
    func myFirstRequest(completion: @escaping(Result<[Dish], Error>) -> Void) {
        request(route: .temp, method: .get, completion: completion)
    }
    
    /// request is the wrapper that perform requests for the app
    /// - Parameters:
    ///   - route: the route address to perform the request
    ///   - method: http verb to perform the request
    ///   - parameters: any given extra parameters
    ///   - type: generics type to decode the response data
    ///   - completion: result of the fucntion request task
    private func request<T: Decodable>(
        route: Route,
        method: Method,
        parameters: [String: Any]? = nil,        
        completion: @escaping(Result<T, Error>) -> Void) {
            guard let request = createRequest(route: route, method: method, parameters: parameters) else {
                completion(.failure(AppError.unknownError))
                return
            }
            
            // handle multiple requests, i need to take a deep look in this topic
            URLSession.shared.dataTask(with: request) { data, response, error in
                var result: Result<Data, Error>?
                if let data = data {
                    result = .success(data)
                    let _ = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                  //  print("The response is: \(responseString)")
                } else if let error = error {
                    result = .failure(error)
                    print("The error is: \(error.localizedDescription)")
                }
                
                DispatchQueue.main.async {
                    self.handleResponse(result: result, completion: completion)
                }
            }.resume()
        }
    
    /// this function handle the response from a request
    /// - Parameters:
    ///   - result: request result
    ///   - completion: completion closure to handle the task
    private func handleResponse<T: Decodable>(
        result: Result<Data, Error>?,
        completion: (Result<T, Error>) -> Void) {
            guard let result = result else {
                completion(.failure(AppError.unknownError))
                return
            }
            
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                guard let response = try?
                        decoder.decode(ApiResponse<T>.self, from: data) else {
                    completion(.failure(AppError.errorDecoding))
                    return
                }
                
                if let error = response.error {
                    completion(.failure(AppError.serverError(error)))
                    return
                }
                
                if let decodedData = response.data {
                    completion(.success(decodedData))
                } else {
                    completion(.failure(AppError.unknownError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    
    /// this functions works as a wrapper to generate UrlRequets
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: type of request to be made, should be a http verb
    ///   - parameters: whatever extra information you need to pass to the backend as a dictionary of key string and value Any
    /// - Returns: URLRequest
    private func createRequest(
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
                    // adding url params to a request
                    var urlComponents = URLComponents(string: urlString)
                    urlComponents?.queryItems = params.map {URLQueryItem(name: $0, value: "\($1)")}
                    urlRequest.url = urlComponents?.url
                case .post, .delete, .patch:
                    // adding body data to a request
                    let bodyData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                    urlRequest.httpBody = bodyData
                }
            }
            return urlRequest
        }
}
