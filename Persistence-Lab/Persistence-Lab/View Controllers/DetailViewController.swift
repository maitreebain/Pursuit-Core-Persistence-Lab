//
//  DetailViewController.swift
//  Persistence-Lab
//
//  Created by Maitree Bain on 1/22/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var favoritesLabel: UILabel!
    
    var image: Image?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    @IBAction func favoritedBy(_ sender: UIBarButtonItem) {
    
        guard let image = image else {
            print("not image")
            return
        }
        
        let favorite = Image(largeImageURL: image.largeImageURL, likes: image.likes, favorites: image.favorites, tags: image.tags, previewURL: image.previewURL, webformatURL: image.webformatURL)
        
        do {
            try PersistenceHelper.createFavorite(for: favorite)
            print("added to favorite")
        } catch {
            print("could not create favorite")
        }
        
        favoriteButton.image = UIImage(systemName: "heart.fill")
        
        favoriteButton.isEnabled = false
    }
    
    private func updateUI() {
        
        guard let image = image else {
            print("not guarded")
            return
        }
        
        likesLabel.text = "\(image.likes ?? 0)"
        favoritesLabel.text = "\(image.favorites ?? 0)"
        
        detailImage.getImage(with: image.largeImageURL) { [weak self] (result) in
            
            switch result{
            case .failure(let appError):
                print("error loading image: \(appError)")
                DispatchQueue.main.async {
                    self?.detailImage.image = UIImage(systemName: "xmark.fill")
                }
            case .success(let image):
                self?.detailImage.image = image
            }
        }
    }
    
}
