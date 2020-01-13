//
//  RecipeServices.swift
//  SunbeltTest
//
//  Created by Diego Giraldo Gómez on 13/01/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

enum RecipeResponse {
    case failure(message: String)
    case success(data: RecipeResponseData)
}

public class RecipeServicesManager {
    
    func getRecipes(completion: @escaping (RecipeResponse) -> Void) {
        let URL = try? ("http://www.recipepuppy.com/api").asURL()
        
        let headers: HTTPHeaders = [ "Content-Type":"application/json"]
        
        Alamofire.request(URL!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<RecipeResponseData>) in
            switch response.result{
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(message: error.localizedDescription))
            case .success(let data):
                completion(.success(data: data))
            }
        }
    }
}
