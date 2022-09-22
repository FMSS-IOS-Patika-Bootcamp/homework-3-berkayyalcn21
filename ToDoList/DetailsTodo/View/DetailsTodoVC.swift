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
    private var check: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if todo != nil {
            titleTextField.text = todo?.todo
            descTextView.text = todo?.desc
            dateTextField.text = todo?.date
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkCompleted()
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func todoIsDoneButtonTapped(_ sender: Any) {
        
        if todo != nil {
            viewModel.sendDataUpdate(todo: todo!)
            if check {
                check = false
                isCompletedButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            }else {
                check = true
                isCompletedButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            }
        }
    }
    
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
