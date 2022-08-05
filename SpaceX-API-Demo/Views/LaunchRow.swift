//
//  LaunchRow.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import SwiftUI

struct LaunchRow: View {
    

    let launch: Launch
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 5) {
            
            Text(launch.name ?? "")
                .font(.headline)
            Text(formatStringDate(date: launch.dateUTC!))
            Text("Lancement : \(launch.success ?? false ? "😅 Succès":"🫤 Echèc")")
            
        }
    }
    
    func formatStringDate(date: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let newDate = dateFormatter.date(from: date)
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
            return dateFormatter.string(from: newDate!)
    }
  
}


