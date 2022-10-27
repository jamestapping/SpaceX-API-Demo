//
//  ErrorView.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var launchFetcher = LaunchFetcher()
    
    var body: some View {
        
        VStack{
            
            Text("🫤").font(.system(size: 80))
            
            Text(launchFetcher.errorMessage ?? "")
            
        }
    }
    
}


    struct ErrorView_Previews: PreviewProvider {
        
        static var previews: some View {
            
            
            ErrorView(launchFetcher: LaunchFetcher())
            
        }
        
    }


