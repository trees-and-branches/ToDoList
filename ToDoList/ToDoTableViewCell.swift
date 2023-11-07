//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by shark boy on 11/6/23.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    weak var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func completeButtonTapped(_ sender: Any) {
        delegate?.checkmarkTapped(sender: self)
    }
    
}

protocol ToDoCellDelegate: AnyObject {
    func checkmarkTapped(sender: ToDoTableViewCell)
}

extension ToDoTableViewCell: ToDoCellDelegate {
    func checkmarkTapped(sender: ToDoTableViewCell) {
    }
    
    
}
