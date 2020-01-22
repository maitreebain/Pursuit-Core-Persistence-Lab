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
