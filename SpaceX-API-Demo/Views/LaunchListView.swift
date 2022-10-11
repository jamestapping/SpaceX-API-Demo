//
//  LaunchListView.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import SwiftUI

struct LaunchListView: View {
    
    let launches: [Launch]
    
    var body: some View {
        
        NavigationView {
            
            List{
                ForEach(launches) { launch in
                    
                    NavigationLink {
                        
                        LaunchDetailView(launch: launch)
                        
                    } label :  {
                        
                        LaunchRow(launch: launch)
                        
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Space X Launches")
        }
    }
}

