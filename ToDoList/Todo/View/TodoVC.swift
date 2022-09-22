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
    private var todos: [Todo] = []
    let todoVM = TodoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        todos = todoVM.didViewLoad()
        tableView.reloadData()
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let todo = todos[indexPath.row]
        let detailsController = storyboard?.instantiateViewController(withIdentifier: "DetailsTodoVC") as! DetailsTodoVC
        detailsController.todo = todo
        navigationController?.pushViewController(detailsController, animated: true)
    }
}

extension TodoVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier, for: indexPath) as! TodoTableViewCell
        cell.titleLabel.text = todo.todo
        cell.dateLabel.text = todo.date
        if todo.isCompleted {
            cell.isCompletedButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            cell.isCompletedButton.tintColor = UIColor(named: "MainColor")
        }else {
            cell.isCompletedButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            cell.isCompletedButton.tintColor = .placeholderText
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { action, indexPaht, void  in
            
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            context.delete(self.todos[indexPath.row])
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
            self.todos.remove(at: indexPath.row)
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}

 
