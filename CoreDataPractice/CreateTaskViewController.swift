//
//  CreateTaskViewController.swift
//  CoreDataPractice
//
//  Created by Jason Toth on 8/16/18.
//  Copyright © 2018 Jason Toth. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController() // link to ViewController so task object can be passed around
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveTask(_ sender: Any) {
        // Create task using input data
        let task = Task() // create new tasks using input values
        if taskNameTextField.text != nil {
            task.name = taskNameTextField.text!
            task.important = importantSwitch.isOn
        }
        
        // Add task to Tasks array (other controller)
        previousVC.tasks.append(task) // add new task to tasks array
        previousVC.tableView.reloadData() // reload list page to refresh data
        navigationController?.popViewController(animated: true) // navigate back to task list page
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
