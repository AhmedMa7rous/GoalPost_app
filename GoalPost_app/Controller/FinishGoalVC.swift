//
//  FinishGoalVC.swift
//  GoalPost_app
//
//  Created by Ma7rous on 10/8/21.
//  Copyright © 2021 Ma7rous. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pointsTxtField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointsTxtField.delegate = self
        
        createGoalBtn.bindToKeyboard()
        
    }
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetails()
    }
    
    @IBAction func pressedCreateGoalBtn(_ sender: Any) {
        //pass data into core data goal model
        if pointsTxtField.text != "" {
            self.save{(complete) in if complete{
                dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    
    func save(completion: (_ finished: Bool) -> ()){
        guard let manageContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let goal = Goal(context: manageContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTxtField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try manageContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save:\(error.localizedDescription)")
            completion(false)
        }
    }
    
    
}
