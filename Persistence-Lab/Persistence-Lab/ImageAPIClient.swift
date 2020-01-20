//
//  ImageAPIClient.swift
//  Persistence-Lab
//
//  Created by Maitree Bain on 1/17/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import Foundation
import NetworkHelper

struct ImageAPIClient {
    
    static func fetchImages(for search: String, completion: @escaping (Result<Image, AppError>) -> ()){
        
        let endPointurl = ""
        
        let url = URL(string: endPointurl)
        
        let request = url
        
        NetworkHelper.shared.performDataTask(with: <#T##URLRequest#>, completion: <#T##(Result<Data, AppError>) -> ()#>)
    }
}
