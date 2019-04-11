//
//  NSError+Extensions.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

extension NSError {
    
    class func error(domain:String, code:Int, description:String ) -> Error {
        return NSError(domain: domain,
                       code: code,
                       userInfo: [ NSLocalizedDescriptionKey : description, NSDebugDescriptionErrorKey : description])
    }
    
    class func show(_ error:Error, onViewController:UIViewController)  {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.title = "Error"
        alert.message = error.localizedDescription
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        onViewController.present(alert, animated: true, completion: nil)
    }
}
