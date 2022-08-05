//
//  ContentView.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    
@StateObject var launchFetcher = LaunchFetcher()
    
    var body: some View {
        
        if launchFetcher.isLoading {
            
            ProgressView()
            
        } else if launchFetcher.errorMessage != nil {
            
            ErrorView(launchFetcher: launchFetcher)
            
        } else {
            
            LaunchListView(launches: launchFetcher.launches)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

