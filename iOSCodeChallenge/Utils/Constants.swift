//
//  Constants.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

struct App {
    static let shared = App()
    static let infoPath = Bundle.main.path(forResource: "Info", ofType: ".plist")
    let configDictionary = NSDictionary(contentsOfFile: infoPath ?? "")
    
    static func getValueFromInfoPlist(with key: String) -> String {
        guard let dictionary = App.shared.configDictionary,
            let value = dictionary[key] as? String else {
                fatalError("\(key) key plist not found")
        }
        return value
    }
}

struct Constants {
    static let postCellIdentifier = "postCellIdentifier"
    
    static let baseURL = App.getValueFromInfoPlist(with: "BaseURLKey")
    
    static let defaultHeadersRequests = [
        "Accept": "application/json",
        "Content-Type": "application/json"
    ]
    
    static let defaultError = NSError.error(domain: APIClientErrorDomain,
                                            code: APIClientErrorUnsuccessfulRequest,
                                            description: "Unsuccessful parse data")
}
