//
//  APIManager.swift
//  JLLExample
//
//  Created by Mike Jasso on 29/07/24.
//

import Foundation

class APIManager {
    
    private let baseURL: String = "https://dummy.restapiexample.com/api/v1/"
    typealias NetworkResponse = (data: Data, response: URLResponse)
    
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    
    func getData<T>(from endpoint: endpoints) async throws -> T where T: Decodable {
        guard let urlPath = URL(string: baseURL.appending(endpoint.rawValue))
        else {
            throw ApiError.invalidPath
        }
        
        var request = URLRequest(url: urlPath)
        request.httpMethod = "GET"
        
        
        let response: NetworkResponse = try await session.data(for: request)
        return try decoder.decode(T.self, from: response.data)
    }
}



enum endpoints: String {
    case employee = "employees"
}

enum ApiError: Error {
    case invalidPath
}
