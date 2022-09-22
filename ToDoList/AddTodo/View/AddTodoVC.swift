//
//  AddTodoVC.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import UIKit


class AddTodoVC: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    private let viewModel = AddTodoVM()
    private let model = AddTodoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
 
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if titleTextField.text != "" && descTextView.text != "" && dateTextField.text != "" {
            viewModel.sendDataPost(titleTextField.text!, descTextView.text!, dateTextField.text!, false)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
}
