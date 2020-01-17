//
//  Item.swift
//  ShoppingList
//
//  Created by Devin Singh on 1/17/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
    }
}
