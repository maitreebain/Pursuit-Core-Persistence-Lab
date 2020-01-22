//
//  ImageModel.swift
//  Persistence-Lab
//
//  Created by Maitree Bain on 1/17/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import Foundation

struct ImageDataLoad: Codable {
    let hits: [Image]
}

struct Image: Codable {
    let largeImageURL: String
    let likes: Int?
    let favorites: Int?
    let tags: String?
    let previewURL: String?
    let webformatURL: String?
}
