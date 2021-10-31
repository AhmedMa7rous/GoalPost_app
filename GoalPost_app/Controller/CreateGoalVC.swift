//
//  CreateGoalVC.swift
//  GoalPost_app
//
//  Created by Ma7rous on 10/8/21.
//  Copyright © 2021 Ma7rous. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!

    
    var goalType: GoalType = .shortTerm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goalTxtView.delegate = self
        
        nextBtn.bindToKeyboard()
        longTermBtn.setDeselectedColor()
        shortTermBtn.setSelectedColor()
    }
    
    @IBAction func pressedShortTermBtn(_ sender: Any){
        
        goalType = .shortTerm
        longTermBtn.setDeselectedColor()
        shortTermBtn.setSelectedColor()
        
    }
    
    @IBAction func pressedLongTermBtn(_ sender: Any){
           
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
           
       }
    
    @IBAction func whenPressNextBtn(_ sender: Any){
        
        if goalTxtView.text != "" && goalTxtView.text != "What is your Goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(identifier: "finishGoalVC") as? FinishGoalVC else {
                return
            }
            
            finishGoalVC.initData(description: goalTxtView.text!, type: goalType)
            
            presentingViewController?.presentSecondaryDetails(finishGoalVC)
            
        }
        
    }
    
    @IBAction func pressedBackBtn(_ sender: Any) {
        
        dismissDetails()
        
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTxtView.text = ""
        goalTxtView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    

}
