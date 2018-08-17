//
//  SelectedTaskViewController.swift
//  CoreDataPractice
//
//  Created by Jason Toth on 8/16/18.
//  Copyright © 2018 Jason Toth. All rights reserved.
//

import UIKit

class ViewTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // render selected task on screen
        if (task!.important) {
            taskLabel.text = "‼️ \(task!.name!)"
        }
        else {
            taskLabel.text = task!.name!
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func completeTask(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true) // navigate back to task list page
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
