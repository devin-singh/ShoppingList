//
//  ItemController.swift
//  ShoppingList
//
//  Created by Devin Singh on 1/17/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

import Foundation
import CoreData

class ItemController {
    
    //Singleton
    static let shared = ItemController()
    
      // MARK: - Properties
      
      // Create a variable to access the fetched results controller
      var fetchedResultsController: NSFetchedResultsController<Item>
      
      // Create an initializer that gives our fetchedResultsController a value
      init() {
          let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
          
          fetchRequest.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: true)]
          
          let resultsController: NSFetchedResultsController<Item> = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
          fetchedResultsController = resultsController
          do {
              try fetchedResultsController.performFetch()
          } catch {
              print("Error with fetching results \(error.localizedDescription)")
          }
      }
    
    // Crud Methods
    func createGuess(name: String) {
        _ = Item(name: name)
        saveToPersistentStore()
    }
    
    func toggleIsComplete(item: Item) {
        item.isComplete = !item.isComplete
        saveToPersistentStore()
    }
    
    func remove(item: Item) {
        let moc = CoreDataStack.context
        moc.delete(item)
        saveToPersistentStore()
    }
    
    //Persistence
    func saveToPersistentStore() {
        if CoreDataStack.context.hasChanges {
            try? CoreDataStack.context.save()
        }
    }
}
