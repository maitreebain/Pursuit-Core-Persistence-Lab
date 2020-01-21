//
//  ViewController.swift
//  Persistence-Lab
//
//  Created by Maitree Bain on 1/17/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    @IBOutlet weak var imageSearchBar: UISearchBar!
 
    @IBOutlet weak var imageCollection: UICollectionView!
    
    var imageData = [ImageDataLoad]() {
        didSet {
            DispatchQueue.main.async {
                self.imageCollection.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCollection.delegate = self
        imageCollection.dataSource = self
        imageSearchBar.delegate = self
    }

    

}

extension DisplayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "displayCell", for: indexPath) as? ImageCollectionCell else {
            fatalError("cell did not conform")
        }
        
        return cell
    }
    
    
}

extension DisplayViewController: UICollectionViewDelegate {
    
}


extension DisplayViewController: UISearchBarDelegate {
    
}
