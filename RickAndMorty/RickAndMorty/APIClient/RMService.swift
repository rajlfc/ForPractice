//
//  RMService.swift
//  RickAndMorty
//
//  Created by Sudipta Kumar Bhattacharjee on 29/12/22.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    enum RMServieError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>(_ request: RMRequest,type: T.Type,completionHandler: @escaping (Result<T,Error>)->Void) {
        guard let urlRequest = self.request(from: request) else {
            completionHandler(.failure(RMServieError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                completionHandler(.failure(error ?? RMServieError.failedToGetData))
                return
            }
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completionHandler(.success(result))
            } catch {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
    
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
