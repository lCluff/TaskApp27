//
//  TaskDetailTableViewController.swift
//  TaskApp27
//
//  Created by Leah Cluff on 6/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDueTextField: UITextField!
    @IBOutlet var dueDatePicker: UIDatePicker!
    @IBOutlet weak var taskNotesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDueTextField.inputView = dueDatePicker
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) { // standard boilerplate
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var dueDateValue: Date?
    
    private func updateViews() {
        guard let task = task, isViewLoaded else { return }
        title = task.name
        taskNameTextField.text = task.name
        taskDueTextField.text = (task.due as Date?)?.stringValue()
        taskNotesTextView.text = task.notes
    }
    
    //MARK: - Let's get some action eeeyyyyyyy
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, let notes = taskNotesTextView.text, let date = dueDateValue else { return }
        
        if let task = task {
            // update
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, due: date)
        } else {
            // create
            TaskController.sharedInstance.add(taskWithName: name, notes: notes, due: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.taskDueTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        self.taskNameTextField.resignFirstResponder()
        self.taskDueTextField.resignFirstResponder()
    }
} // class ends here



