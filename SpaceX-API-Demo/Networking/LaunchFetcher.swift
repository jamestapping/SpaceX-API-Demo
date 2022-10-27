//
//  LaunchFetcher.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import Foundation
import SwiftUI

class LaunchFetcher: ObservableObject {
    
    @Published var launches = [Launch]()
    @Published var errorMessage: String? = nil
    @Published var isLoading = false

    init (){
        
        fetchAllLaunches()
        
    }
    
    func fetchAllLaunches() {
        
        isLoading = true
        
        //TODO show error if can't create url
        
        let service = APIService()
        
        let url = URL(string: "https://api.spacexdata.com/v4/launches")
        
        service.fetchLaunches(url: url) { result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.errorMessage = nil
            }
            
            switch result {
                
            case .failure(let error):
                
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                
            case .success(let launches):
                
                DispatchQueue.main.async {
                    self.launches = launches
                }
                
                //print (launches)
                
            }
        }
    }
    
    // MARK: Preview helpers

    static func errorState() -> LaunchFetcher {
        
        let fetcher = LaunchFetcher()
        
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        
        return fetcher
    }

    static func successState() -> LaunchFetcher {
        
        let fetcher = LaunchFetcher()
        fetcher.launches = [Launch.example1()]
        
        return fetcher
        
    }
    
}



