//
//  ReposDataStore.swift
//  Auth
//
//  Created by Irina Ernst on 9/27/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import Foundation

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    private init() {}

    var repositories:[Repo] = []

    func getRepositoriesWithCompletion(completion: @escaping (Bool) -> ()) {
        
        GitHubAPIClient.getRepositoriesWithCompletion { json in
            
            guard let json = json else {
                print("ERROR: JSON data was not received by data store")
                completion(false)
                return
            }
            
            for (_, object) in json {
                
                let repo = Repo(json: object)
                if let repoForArray = repo {
                    self.repositories.append(repoForArray)
                }
                
            }
            completion(true)
            
        }
        
    }
}
