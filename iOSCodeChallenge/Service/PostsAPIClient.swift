//
//  PostsAPIClient.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

extension APIClient {
    
    /// Retrieves the top messages
    ///
    /// - parameter callback:     The service path.
    func loadPosts(withCallBack completion: @escaping (PostResponse?, Error?) -> Void){
        
        let requestPath = "/top"
        let headersDic = Constants.defaultHeadersRequests
        
        APIClient.sharedInstance.executeRequest(path: requestPath,
                                                headers: headersDic) { (responseRequest, error) in
                                                    
                                                    if let data = responseRequest {
                                                        
                                                        do {
                                                            
                                                            let result = try JSONDecoder().decode(PostResponse.self, from: data)
                                                            print(result)
                                                            completion(result, nil)
                                                            
                                                        } catch {
                                                            completion(nil, error)
                                                        }
                                                    } else {
                                                        completion(nil, Constants.defaultError)
                                                    }
        }
    }
}
