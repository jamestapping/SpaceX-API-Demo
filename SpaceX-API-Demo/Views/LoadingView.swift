//
//  LoadingView.swift
//  SpaceX-API-Demo
//
//  Created by James Tapping on 26/10/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("🚀")
                .font(.system(size:80))
            
            ProgressView()
            
            Text("Fetching launch information...")
            
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
