//
//  CoreDataStack.swift
//  ShoppingList
//
//  Created by Devin Singh on 1/17/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ShoppingList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error) \(error.userInfo)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext{ return container.viewContext }
}
