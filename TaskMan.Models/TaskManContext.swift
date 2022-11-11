//
//  TaskManContext.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 10/11/2022.
//

import CoreData
import Foundation

public class TaskManContext : NSManagedObjectContext {
    
    func saveChanges() {
        
        do {
           try super.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func fetchResults<T>(request: NSFetchRequest<T>) -> [T] where T : NSFetchRequestResult {
        
        do {
            return try super.fetch(request)
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
