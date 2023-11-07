//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by shark boy on 11/5/23.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var toDo: ToDo?
    
    var isDatePickerHidden = true
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDo {
            navigationItem.title = "To-Do"
            titleTextField.text = toDo.title
            isCompleteButton.isSelected = toDo.isComplete
            dueDateLabel.text = "\(toDo.dueDate)"
            notesTextView.text = toDo.notes
            
        }
        updateSaveButtonStateTxtLbl()
        
        
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath where isDatePickerHidden == true:
            return 0
        case notesIndexPath:
            return 200 default:
            return UITableView.automaticDimension
            
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return 216
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt
                            indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == dateLabelIndexPath {
            isDatePickerHidden.toggle()
            updateDateLabel(date: dueDatePicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else { return }
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePicker.date
        let notes = notesTextView.text
        if toDo != nil {
            toDo?.title = title
            toDo?.isComplete = isComplete
            toDo?.dueDate = dueDate
            toDo?.notes = notes
        } else {
            toDo = ToDo(title: title, isComplete: isComplete,
                        dueDate: dueDate, notes: notes)
        }
    }
    
    
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        
        updateDateLabel(date: dueDatePicker.date)
        updateSaveButtonStateTxtLbl()
        //        saveButton.isEnabled = false
        
    }
    
    @IBAction func returnPressed(_ sender: Any) { //read from the book lol
        
        isCompleteButton.isSelected = true
        
    }
    
    func updateDateLabel(date:Date) {
        dueDateLabel.text = date.formatted(.dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute()) // holy enumeration batman!
    }
    
    
    func updateSaveButtonStateTxtLbl() {
        let shouldEnableSaveButton = titleTextField.text?.isEmpty ==
        false
        saveButton.isEnabled = shouldEnableSaveButton
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        
        updateDateLabel(date: sender.date)
        saveButton.isEnabled = true // "hacking" -- I just wanted to make the ToDo require me to set a date
        //TODO: add date/time groups for recurring events(integrate this into calendar apps too hehe)
        
        
        
    }
    
    
    
    
}
