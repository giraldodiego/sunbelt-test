//
//  HomeViewController.swift
//  SunbeltTest
//
//  Created by Diego Giraldo Gómez on 11/01/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import UIKit
import MBProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data: [Recipe]?
    var selectedRecipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    func loadData(){
        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading"
        let manager = RecipeServicesManager()
        manager.getRecipes { (response) in
            switch response{
            case .failure(let msg):
                MBProgressHUD.hide(for: self.view, animated: true)
                print(msg)
            case .success(let data):
                MBProgressHUD.hide(for: self.view, animated: true)
                if let res = data.results{
                    self.data = res
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToDetail"{
            let destination = segue.destination as! RecipeViewController
            destination.recipe = self.selectedRecipe
        }
    }
}

