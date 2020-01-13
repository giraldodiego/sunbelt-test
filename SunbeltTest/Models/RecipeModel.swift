//
//  RecipeModel.swift
//  SunbeltTest
//
//  Created by Diego Giraldo Gómez on 13/01/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import Foundation
import ObjectMapper

public class RecipeResponseData: Mappable{
    var title: String?
    var version: String?
    var href: String?
    var results: [Recipe]?
    
    init(){
        
    }
    
    public required init?(map: Map) {
        title <- map["title"]
        version <- map["version"]
        href <- map["href"]
        results <- map["results"]
    }
    
    public func mapping(map: Map) {
        title <- map["title"]
        version <- map["version"]
        href <- map["href"]
        results <- map["results"]
    }
}

public class Recipe: Mappable{
    var title: String?
    var ingredients: String?
    var href: String?
    var thumbnail: String?
    
    init(){
        
    }
    
    public required init?(map: Map) {
        title <- map["title"]
        ingredients <- map["ingredients"]
        href <- map["href"]
        thumbnail <- map["thumbnail"]
    }
    
    public func mapping(map: Map) {
        title <- map["title"]
        ingredients <- map["ingredients"]
        href <- map["href"]
        thumbnail <- map["thumbnail"]
    }
}
