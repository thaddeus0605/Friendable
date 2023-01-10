//
//  DataController.swift
//  Friendable
//
//  Created by Thaddeus Dronski on 1/10/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Friendable")
    
    init() {
        container.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
