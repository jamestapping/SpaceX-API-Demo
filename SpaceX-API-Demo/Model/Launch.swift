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
    
    var formattedDate: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let newDate = dateFormatter.date(from: dateUTC ?? "No Date")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        return dateFormatter.string(from: newDate!)
    }
    
    // MARK: - Example date for previews
    
    static func example1() -> Launch {
        
        let patch = Patch(small: "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
                          large: "https://images2.imgbox.com/5b/02/QcxHUb5V_o.png")
        
        let reddit = Reddit(campaign: "", launch: "", media: "", recovery: "")
        let flickr = Flickr(small: ["",""], original: ["",""])
        let links = Links(patch: patch, reddit: reddit, flickr: flickr)
        let launch = Launch (links: links, success: true, details: "Launch was scrubbed on first attempt, second launch attempt was successful", name: "COTS 2", dateUTC: "2012-05-22T07:44:00.000Z", dateUnix: 1335944640, dateLocal: "2010-12-08T11:43:00-04:00", launchLibraryID: "", id: "5eb87cdeffd86e000604b330")
        
        return launch
    }
}

// MARK: - Links
struct Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
}

struct Reddit : Codable {
   let campaign: String?
   let launch: String?
   let media : String?
   let recovery : String?
}

struct Patch: Codable {
    let small, large: String?
}

struct Flickr : Codable {
   let small : [String]
   let original : [String]
}


