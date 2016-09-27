//
//  GitHubAPIClient.swift
//  Auth
//
//  Created by Irina Kalashnikova on 9/26/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit

class GitHubAPIClientAPI {
    
    static let repo = "https://api.github.com/repositories?client_id=\(GITHUB_CLIENT_ID)&client_secret=\(GITHUB_CLIENT_SECRET)"
    static let token = "https://github.com/login/oauth/access_token"
    static let oauth = "https://github.com/login/oauth/authorize?client_id=\(GITHUB_CLIENT_SECRET)&scope=repo"
    
    static func starred(repoName repo: String) -> String? {
        let starredURL = "https://api.github.com/user/starred/\(repo)?client_id=\(GITHUB_CLIENT_ID)&client_secret=\(GITHUB_CLIENT_SECRET)&access_token=\(GITHUB_ACCESS_TOKEN)"
        
        // TO DO: Append URL string with access token
        
        return nil
    }
}

extension GitHubAPIClientAPI {
    
//    class func getRepositoriesWithCompletion(completionHandler: (Dictionary?) -> Void) {
//        
////        Alamofire.request(.GET, URLRouter.repo)
////            .validate()
////            .responseJSON(completionHandler: { response in
////                switch response.result {
////                case .Success:
////                    if let data = response.data {
////                        completionHandler(JSON(data: data))
////                    }
////                case .Failure(let error):
////                    print("ERROR: \(error.localizedDescription)")
////                    completionHandler(nil)
////                }
////            })
//        
//    }
    
    //

}
