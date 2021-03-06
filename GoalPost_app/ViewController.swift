//
//  GoalsVC.swift
//  GoalPost_app
//
//  Created by Ma7rous on 10/8/21.
//  Copyright © 2021 Ma7rous. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    @IBOutlet weak var goalsTableView: UITableView!
    
    var goals: [Goal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsTableView.delegate = self
        goalsTableView.dataSource = self
        goalsTableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.fetch { (complete) in
            if complete{
                if goals.count >= 1 {
                    goalsTableView.isHidden = false
                    
                } else {
                    goalsTableView.isHidden = true
                }
            }
        }
        
        goalsTableView.reloadData()
    }

    @IBAction func addGoal(_ sender: Any) {
        guard let creatGaolVC = storyboard?.instantiateViewController(identifier: "CreateGoalVC") else {
            return
        }
        
        presentDetails(creatGaolVC)
    }
    
}


extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell()
        }
        
        let goal = goals[indexPath.row]
        
        cell.updateCellView(goal: goal)
        return cell
    }
    
}


extension GoalsVC{
    func fetch(completion: (_ complete: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            goals = try managedContext.fetch(fetchRequest) 
            completion(true)
        } catch {
            fatalError("Failed to fetch employees: \(error.localizedDescription)")
            completion(false)
        }
    }
}
