//
//  FavoritesViewController.swift
//  Persistence-Lab
//
//  Created by Maitree Bain on 1/22/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    var imageData = [Image]() {
        didSet {
            DispatchQueue.main.async {
                self.favoritesTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    private func loadData() {
        
    }

}

extension FavoritesViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        switch editingStyle {
//        case .insert:
//            // only gets called if "insertion control" exist and gets selected
//            print("inserting....")
//        case .delete:
//            print("deleting..")
//            // 1. remove item for the data model e.g events
//            events.remove(at: indexPath.row) // remove event from events array
//            deleteEvents(indexPath: indexPath)
//            // 2. update the table view
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        default:
//            print("......")
//        }
}
