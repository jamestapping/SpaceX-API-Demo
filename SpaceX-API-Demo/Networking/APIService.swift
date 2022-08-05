//
//  APIService.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import Foundation

struct APIService {
    
    func fetchLaunches(url: URL?, completion: @escaping(Result<[Launch], APIError> ) -> Void ) {
        
        guard  let url =  url else {
            
            let error = APIError.badURL
            
            completion(Result.failure(error))
            
            return
            
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                // TODO Error
                
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
                
            } else if let data = data {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    let dataResponse = try decoder.decode([Launch].self, from: data)
                    
                    completion(Result.success(dataResponse))
                    
                } catch  {
                    
                    // TODO show error to user
                    print (error)
                    
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                    
                }
                
            }
        
        }
        
        task.resume()
    }
    
}
