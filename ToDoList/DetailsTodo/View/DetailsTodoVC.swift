//
//  DetailsTodoVC.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import UIKit

class DetailsTodoVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var isCompletedButton: UIButton!
    @IBOutlet weak var dateTextField: UITextField!
    var todo: Todo?
    private let viewModel = DetailsTodoVM()
    private var check: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // If this value is not nil
        if todo != nil {
            titleTextField.text = todo?.todo
            descTextView.text = todo?.desc
            dateTextField.text = todo?.date
            check = todo?.isCompleted != nil
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // CheckBox true or false control
        checkCompleted()
    }
    
    // Previous page
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // To do is done or not done button
    @IBAction func todoIsDoneButtonTapped(_ sender: Any) {
        
        if todo != nil {
            viewModel.sendDataUpdate(todo: todo!)
            if todo?.isCompleted == true {
                check = false
                isCompletedButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
                checkCompleted()
            }else {
                check = true
                isCompletedButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
                checkCompleted()
            }
        }
    }
    
    // To do is done or not done image settings func
    func checkCompleted() {
        if todo != nil {
            if todo?.isCompleted == true {
                isCompletedButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            }else {
                isCompletedButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            }
        }
    }
}
