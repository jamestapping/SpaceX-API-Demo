//
//  SpaceXDataResponse.swift
//  SpaceX-API-Demo
//
//  Created by james on 05/08/2022.
//

import Foundation

// MARK: - Launch

struct Launch: Codable, Identifiable {
    
    let links: Links?
    let success: Bool?
    let details: String?
    let name, dateUTC: String?
    let dateUnix: Int?
    let dateLocal: String?
    let launchLibraryID: String?
    let id: String

    enum CodingKeys: String, CodingKey {
         case links
         case success,details
         case name
         case dateUTC = "date_utc"
         case dateUnix = "date_unix"
         case dateLocal = "date_local"
         case launchLibraryID = "launch_library_id"
         case id
     }
    
}

// MARK: - Links
struct Links: Codable {
    let patch: Patch

    enum CodingKeys: String, CodingKey {
        case patch
        
    }
}

// MARK: - Patch
struct Patch: Codable {
    let small, large: String?
}

