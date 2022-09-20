//
//  TodoVC.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import UIKit

class TodoVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let tableViewIdentifier = "TodoTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        register()
    }
    
    private func register() {
        tableView.register(.init(nibName: tableViewIdentifier, bundle: nil), forCellReuseIdentifier: tableViewIdentifier)
    }
    
    
    @IBAction func addTodoButtonTapped(_ sender: Any) {
        let addTodoVC = storyboard?.instantiateViewController(withIdentifier: "AddTodoVC") as! AddTodoVC
        navigationController?.pushViewController(addTodoVC, animated: true)
    }
    
    @IBAction func dateFilterTodoButtonTapped(_ sender: Any) {
    }
    
    
}


extension TodoVC: UITableViewDelegate {
    
}

extension TodoVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier, for: indexPath) as! TodoTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


