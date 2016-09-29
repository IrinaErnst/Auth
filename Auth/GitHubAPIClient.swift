//
//  GitHubAPIClient.swift
//  Auth
//
//  Created by Irina Ernst on 9/26/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GitHubAPIClient {
    // MARK: Path Router
    enum URLRouter {
        static let repo = "https://api.github.com/repositories?client_id=\(GITHUB_CLIENT_ID)&client_secret=\(GITHUB_CLIENT_SECRET)"
        static let token = "https://github.com/login/oauth/access_token"
        static let oauth = "https://github.com/login/oauth/authorize?client_id=\(GITHUB_CLIENT_SECRET)&scope=repo"
        
        static func starred(repoName repo: String) -> String? {
            let starredURL = "https://api.github.com/user/starred/\(repo)?client_id=\(GITHUB_CLIENT_ID)&client_secret=\(GITHUB_CLIENT_SECRET)&access_token=\(GITHUB_ACCESS_TOKEN)"
            return nil
        }
    }
}

// MARK: Repositories
extension GitHubAPIClient {
    
    class func getRepositoriesWithCompletion(completionHandler: @escaping (JSON?) -> Void) {
        //Alamofire.request(.GET, URLRouter.repo)
        Alamofire.request(URLRouter.repo, method: .get, parameters: ["":""], encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        completionHandler(JSON(data: data))
                    }
                case .failure(let error):
                    print("ERROR: \(error.localizedDescription)")
                    completionHandler(nil)
                }
            })
    }

}

// MARK: OAuth
extension GitHubAPIClient {
    class func hasToken() -> Bool {
        return false
    }
}

// MARK: Activity
extension GitHubAPIClient {
    
    class func checkIfRepositoryIsStarred(fullName: String, completionHandler: @escaping (Bool?) -> ()) {
        
        guard let urlString = URLRouter.starred(repoName: fullName) else {
            print("ERROR: Unable to get url path for starred status")
            completionHandler(nil)
            return
        }
        
        Alamofire.request(URLRouter.repo, method: .get, parameters: ["":""], encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 204...404)
            .responseString(completionHandler: { response in
                switch response.result {
                case .success:
                    if response.response?.statusCode == 204 {
                        completionHandler(true)
                    } else if response.response?.statusCode == 404 {
                        completionHandler(false)
                    }
                case .failure(let error):
                    print("ERROR: \(error.localizedDescription)")
                    completionHandler(nil)
                }
                
                
            })
        
    }
    
    class func starRepository(fullName: String, completionHandler: @escaping (Bool) -> ()) {
        
        guard let urlString = URLRouter.starred(repoName: fullName) else {
            print("ERROR: Unable to get url path for starred status")
            completionHandler(false)
            return
        }
        
        //Alamofire.request(.PUT, urlString)
        Alamofire.request(urlString, method: .put, parameters: ["":""], encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 204...204)
            .responseString(completionHandler: { response in
                switch response.result {
                case .success:
                    completionHandler(true)
                case .failure(let error):
                    print("ERROR: \(error.localizedDescription)")
                    completionHandler(false)
                }
            })
        
    }
    
    class func unStarRepository(fullName: String, completionHandler: @escaping (Bool) -> ()) {
        
        guard let urlString = URLRouter.starred(repoName: fullName) else {
            print("ERROR: Unable to get url path for starred status")
            completionHandler(false)
            return
        }
        
        //Alamofire.request(.DELETE, urlString)
        Alamofire.request(urlString, method: .delete, parameters: ["":""], encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 204...204)
            .responseString(completionHandler: { response in
                switch response.result {
                case .success:
                    completionHandler(true)
                case .failure(let error):
                    print("ERROR: \(error.localizedDescription)")
                    completionHandler(false)
                }
            })
        
    }
    
}


