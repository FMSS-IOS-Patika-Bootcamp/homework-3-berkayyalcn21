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
    var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Date picker setting func
        dateTextFieldSettings()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    // Date picker setting
    func dateTextFieldSettings() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        // Only works in this version
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        }
        dateTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(showDate), for: .valueChanged)
    }
    
    @objc func showDate(uiDatePicker: UIDatePicker) {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd.MM.yyyy"
        let gotDate = dateFormat.string(from: uiDatePicker.date)
        dateTextField.text = gotDate
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
