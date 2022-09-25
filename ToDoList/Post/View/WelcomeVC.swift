//
//  WelcomeVC.swift
//  ToDoList
//
//  Created by Berkay on 19.09.2022.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // Next page
    @IBAction func goOnButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        navigationController?.pushViewController(controller, animated: true)
    }
}
