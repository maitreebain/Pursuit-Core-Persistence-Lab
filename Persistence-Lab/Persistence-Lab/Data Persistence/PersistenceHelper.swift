//
//  PersistenceHelper.swift
//  Persistence-Lab
//
//  Created by Maitree Bain on 1/22/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import Foundation

enum DataPersistenceError: Error { 
  case savingError(Error)
  case fileDoesNotExist(String)
  case noData
  case decodingError(Error)
  case deletingError(Error)
}

class PersistenceHelper {
    
    private var imageData = [Image]()
    
    private var filename: String
    
    init(filename: String) {
        self.filename = filename
    }
    
    func favorite() throws {
        
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        do {
            let data = try PropertyListEncoder().encode(imageData)
            
            try data.write(to: url)
        }catch {
            throw DataPersistenceError.savingError(error)
        }
        
    }
    
    func delete(image index: Int) throws{
        imageData.remove(at: index)
        
        do {
            try favorite()
        } catch {
            throw DataPersistenceError.deletingError(error)
        }
    }
    
    
}
