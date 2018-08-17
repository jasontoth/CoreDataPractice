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
        tableView.dataSource = self
        tableView.delegate =  self
    }

    // This is called anytime the View Controller is about to appear on the screen
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        // render tasks on screen
        if task.important {
            cell.textLabel?.text = "‼️ \(task.name!)"
        }
        else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    // listener for selecting a task from the list
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "viewTask", sender: task)
    }
    
    // listener for 'add' button press
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        }
        catch {
            print("Error while fetching tasks")
        }
    }
    
    // segue logic to either add or view task
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "viewTask" {
            let nextVC = segue.destination as! ViewTaskViewController
            nextVC.task = sender as? Task
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

