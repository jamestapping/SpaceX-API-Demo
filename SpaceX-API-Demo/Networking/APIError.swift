//
//  APIError.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        
        // User feedback
        
        switch self {
            
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse( _ ):
            return "Sorry, the connection to the server failed"
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong"
            
        }
    }
    
    var description: String {
        
        // Debug
        
        switch self {
            
        case .unknown : return "unknown error"
        case .badURL: return "Invalid URL"
        case .url(let error):
            return error?.localizedDescription ?? "URL Session error"
        case .parsing(let error):
            return "Parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "Bad Response with status code \(statusCode)"
        }
    }
}
