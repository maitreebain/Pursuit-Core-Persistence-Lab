//
//  ImageModel.swift
//  Persistence-Lab
//
//  Created by Maitree Bain on 1/17/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import Foundation

struct ImageDataLoad: Decodable {
    let hits: [Image]
}

struct Image: Decodable {
    let largeImageURL: String
}
