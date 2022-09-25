//
//  ViewController.swift
//  ToDoList
//
//  Created by Berkay on 19.09.2022.
//

import UIKit

class PostListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = PostListViewModel()
    private var items: [PostCellViewModel] = []
    @IBOutlet weak var colorWell: UIColorWell!
    private var newColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView delegate and register settings
        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        colorWell.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
    }
    
    // TableView delegate and register func
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }
    
    // TableView register func
    func registerCell() {
        tableView.register(.init(nibName: "PostListTableViewCell", bundle: nil), forCellReuseIdentifier: "PostListTableViewCell")
    }
    
    // TabBar color change
    @objc func colorChanged() {
        newColor = colorWell.selectedColor
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = newColor
        tabBarColor(itemAppearance: appearance.stackedLayoutAppearance)
        tabBarColor(itemAppearance: appearance.inlineLayoutAppearance)
        tabBarColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    
    func tabBarColor(itemAppearance: UITabBarItemAppearance) {
        // Selected status
        itemAppearance.selected.iconColor = newColor
    }
}

extension PostListViewController: PostListViewModelViewProtocol {
    
    // Take data from model
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showEmptyView() {
        // TODO:
    }
    
    func hideEmptyView() {
        // TODO:
    }
}

extension PostListViewController: UITableViewDelegate {
    
    // TableView selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PostListViewController: UITableViewDataSource {
    
    // TableView total row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // TableView cell value settings
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell") as! PostListTableViewCell
        cell.postTitleLabel.text = items[indexPath.row].title?.capitalized
        cell.postDescLabel.text = items[indexPath.row].desc
        return cell
    }
    
    
}

