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
    
    static private var imageData = [Image]()
    
    static private var filename = "images.plist"
    
    static func save() throws {
        
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        do {
            let data = try PropertyListEncoder().encode(imageData)
            
            try data.write(to: url, options: .atomic)
        }catch {
            throw DataPersistenceError.savingError(error)
        }
        
    }
    
    static func createFavorite(for favoriteImage: Image) throws {
        imageData.append(favoriteImage)
        
        do {
            try save()
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    
    static func delete(image index: Int) throws{
        imageData.remove(at: index)
        
        do {
            try save()
        } catch {
            throw DataPersistenceError.deletingError(error)
        }
    }
    
    
}
