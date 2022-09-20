//
//  TodoTableViewCell.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var isCompletedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cornerView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        cornerView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func isCompletedButtonTapped(_ sender: Any) {
    }
}
