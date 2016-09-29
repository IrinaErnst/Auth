//
//  Extentions.swift
//  Auth
//
//  Created by Irina Ernst on 9/29/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import Foundation

extension URL {
    func getQueryItemValue(named name: String) -> String? {
        
        let components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        let query = components?.queryItems
        return query?.filter({$0.name == name}).first?.value
    }
}
