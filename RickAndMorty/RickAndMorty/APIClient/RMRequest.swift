//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Sudipta Kumar Bhattacharjee on 29/12/22.
//

import Foundation

final class RMRequest {
    // Base url
    // Endpoint
    // Path components
    // Query parameters
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    let endPoint: RMEndpoint
    
    let pathComponents: [String]
    let queryParameters: [URLQueryItem]
    
    /// constructed url for api end request
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {
                    return nil
                }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
   
    public init(endPoint: RMEndpoint,pathComponents: [String] = [],queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.queryParameters = queryParameters
        self.pathComponents = pathComponents
    }
}

extension RMRequest {
    static let listCharacterRequests = RMRequest(endPoint: .character)
}
