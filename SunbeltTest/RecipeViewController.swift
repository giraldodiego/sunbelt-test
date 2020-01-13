//
//  RecipeViewController.swift
//  SunbeltTest
//
//  Created by Diego Giraldo Gómez on 13/01/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import MBProgressHUD

class RecipeViewController: UIViewController {
    
    var recipe: Recipe!
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    func loadUI(){
        if let title = recipe.title{
            self.titleLabel.text = title
        }
        
        if let imageUrl = recipe.thumbnail{
            let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
            loadingNotification.mode = MBProgressHUDMode.indeterminate
            loadingNotification.label.text = "Loading"
            Alamofire.request(imageUrl).responseImage { response in
                MBProgressHUD.hide(for: self.view, animated: true)
                if let image = response.result.value {
                    self.recipeImage.image = image
                }
            }
        }
        
        if let ingredients = recipe.ingredients{
            self.ingredientsLabel.text = ingredients
        }
    }

}
