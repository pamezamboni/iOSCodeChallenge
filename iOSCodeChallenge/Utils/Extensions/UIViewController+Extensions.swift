//
//  UIViewController+Extensions.swift
//  iOSCodeChallenge
//
//  Created by Pamela Zamboni on 11/04/2019.
//  Copyright © 2019 Pamela Zamboni. All rights reserved.
//

import UIKit

extension UIViewController {
    class func create() -> UIViewController {
        if let name = NSStringFromClass(self).components(separatedBy: ".").last {
            return UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        }
        return UIViewController()
    }
    
    func showImageInModal(image: UIImage) -> CustomModalViewController {
        let customModal = CustomModalViewController.create() as! CustomModalViewController
        customModal.image = image
        customModal.providesPresentationContextTransitionStyle = true
        customModal.definesPresentationContext = true
        customModal.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customModal.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        return customModal
    }
    
    func showAlert(title: String, message: String, mainButton: String? = "OK"){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: mainButton, style: .default))
        present(ac, animated: true)
    }
}
