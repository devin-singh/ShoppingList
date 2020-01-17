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
    
    // When initialized, calls fetch.
    init() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error, error.localizedDescription)
        }
    }
    
    // Fetched Results Controller
    let fetchedResultsController: NSFetchedResultsController<Item> = {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let isCompleteSort = NSSortDescriptor(key: "isComplete", ascending: true)
        fetchRequest.sortDescriptors = [isCompleteSort]
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
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
