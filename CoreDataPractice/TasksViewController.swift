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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks();
        tableView.dataSource = self
        tableView.delegate =  self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "‼️ \(task.name)"
        }
        else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "eat food"
        task1.important = true
        
        let task2 = Task()
        task2.name = "go to store"
        task2.important = false
        
        let task3 = Task()
        task3.name = "get paid"
        task3.important = true
        
        return [task1, task2, task3]
    }
    
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

