//
//  LaunchDetailView.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import SwiftUI

struct LaunchDetailView: View {
    
    let launch: Launch
    let imageSize: CGFloat = 200
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 10){
            
            Text("Details : ").bold()
            
            Text (launch.details ?? "Pas details")
            
            AsyncImage(url: URL(string: launch.links?.patch.small ?? "")) { phase in
                if let image = phase.image {
                        
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                
                    
                   } else if phase.error != nil {
                       Color.red
                        .frame(width: imageSize, height: imageSize)
                   } else {
                       ProgressView()
                           .frame(width: imageSize, height: imageSize)
                   }
                
            }
        
            
        }
        
        Spacer()
        
    }
}