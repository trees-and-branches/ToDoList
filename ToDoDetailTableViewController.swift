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
    
    var isDatePickerHidden = true    
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        
        updateDateLabel(date: dueDatePicker.date)
        updateSaveButtonStateTxtLbl()
        saveButton.isEnabled = false
        
    }
    
    @IBAction func returnPressed(_ sender: Any) { //read from the book lol
        
        isCompleteButton.isSelected.toggle()
        
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
