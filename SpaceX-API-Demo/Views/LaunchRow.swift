//
//  LaunchRow.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import SwiftUI

struct LaunchRow: View {
    
    @StateObject var launchFetcher = LaunchFetcher()
    
    let launch: Launch
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            Text(launch.name ?? "")
                .font(.headline)
            Text(launch.formattedDate)
            Text("Lancement : \(launch.success ?? false ? "😅 Succès":"🫤 Echèc")")
        }
    } 
}

//struct LaunchRow_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//
//        LaunchRow(launch: LaunchFetcher.success)
//
//    }
//
//}


