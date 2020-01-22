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
    
    func configureCell(for image: Image) {
        
        imageView.getImage(with: image.largeImageURL) { [weak self] (result) in
            
            switch result{
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(systemName: "xmark.circle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
                
            }
        }
        
    }
    
}
