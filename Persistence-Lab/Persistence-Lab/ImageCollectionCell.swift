//
//  ImageCollectionCell.swift
//  Persistence-Lab
//
//  Created by Maitree Bain on 1/17/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import ImageKit

class ImageCollectionCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    
    var image: Image?
    
    func configureCell(for image: String) {
        
        ImageAPIClient.fetchImages(for: image) { (result) in
            
            switch result{
            case .failure(let appError):
                
            }
        }
    }
    
}
