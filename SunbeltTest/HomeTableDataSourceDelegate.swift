//
//  HomeTableDataSourceDelegate.swift
//  SunbeltTest
//
//  Created by Diego Giraldo Gómez on 13/01/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = data{
            return data.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        if let item = data?[indexPath.row]{
            if let title = item.title{
                cell.textLabel!.text = title
            }
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRecipe = data![indexPath.row]
        self.performSegue(withIdentifier: "homeToDetail", sender: nil)
    }
}
