//
//  Repos.swift
//  Auth
//
//  Created by Irina Ernst on 9/27/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import Foundation
import SwiftyJSON

class Repo {
    
    var id: String
    var name: String
    var fullName: String
    var htmlURL: String
    
    init?(json: JSON) {
        guard let id = json["id"].int
        else { return nil }
    
        guard let name = json["name"].string
        else { return nil }
        
        guard let fullName = json["full_name"].string
        else { return nil }
        
        guard let htmlURL = json["html_url"].string
        else { return nil }
        
        self.id = String(id)
        self.name = name
        self.fullName = fullName
        self.htmlURL = htmlURL
    }
    
}

