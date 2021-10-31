//
//  UIViewControllerExtention.swift
//  GoalPost_app
//
//  Created by Ma7rous on 10/8/21.
//  Copyright © 2021 Ma7rous. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func presentDetails(_ vCToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(vCToPresent, animated: false, completion: nil)
        
    }
    
    func presentSecondaryDetails(_ vCToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        
        guard let presentedViewController = presentedViewController else {return}
        
        presentedViewController.dismiss(animated: false){
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(vCToPresent, animated: false, completion: nil)
        }
        
        
        
    }
    
    func dismissDetails(){
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
        
    }
    
}
