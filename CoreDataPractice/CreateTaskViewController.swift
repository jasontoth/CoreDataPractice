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
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveTask(_ sender: Any) {
        // Create task using input data
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context) // create new tasks using input values
        if taskNameTextField.text != nil {
            task.name = taskNameTextField.text!
            task.important = importantSwitch.isOn
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop back to list page
        navigationController?.popViewController(animated: true) // navigate back to task list page
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
