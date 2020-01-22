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
    
    var imageData = [Image]() {
        didSet {
            DispatchQueue.main.async {
                self.imageCollection.reloadData()
            }
        }
    }
    
    var searchQuery = "" {
        didSet {
            loadData(for: searchQuery)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCollection.delegate = self
        imageCollection.dataSource = self
        imageSearchBar.delegate = self
    }


    private func loadData(for search: String) {
        ImageAPIClient.fetchImages(for: search) { (result) in
            
            switch result {
            case .failure(let appError):
                print("error is: \(appError)")
            case .success(let imageData):
                self.imageData = imageData
            }
        }
        
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

extension DisplayViewController: UICollectionViewDelegateFlowLayout {
    
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let interItemSpacing: CGFloat = 10
    let maxWidth = UIScreen.main.bounds.size.width
    let numberOfItems: CGFloat = 3
    let totalSpacing: CGFloat = numberOfItems * interItemSpacing
    let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
    
    return CGSize(width: itemWidth, height: itemWidth)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) ->  UIEdgeInsets {
    return UIEdgeInsets(top: 20, left: 10, bottom: 5, right: 10)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }

  
}


extension DisplayViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0 {
            loadData(for: searchText)
            return
        }
        
        searchQuery = searchText
    }
    
}
