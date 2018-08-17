//
//  TasksViewController.swift
//  CoreDataPractice
//
//  Created by Jason Toth on 8/16/18.
//  Copyright © 2018 Jason Toth. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = [];
    var selectedIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate =  self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        // render tasks on screen
        if task.important {
            cell.textLabel?.text = "‼️ \(task.name)"
        }
        else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    // listener for selecting a task from the list
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row // get index of selected task
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "viewTask", sender: task)
    }
    
    // listener for 'add' button press
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: nil)
    }
    
    // segue logic to either add or view task
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "addTask" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        else if segue.identifier == "viewTask" {
            let nextVC = segue.destination as! ViewTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

