//
//  TaskManContext.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 10/11/2022.
//

import CoreData
import Foundation

public class TaskManContext : NSManagedObjectContext {
    
    public func saveChanges() {
        
        do {
           try super.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    public func fetchResults<T>(request: NSFetchRequest<T>) -> [T] where T : NSFetchRequestResult {
        
        do {
            return try super.fetch(request)
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    public func deleteBackingFiles() {
        
        let databaseFolderPath = self.persistentStoreCoordinator?.persistentStores[0].url?.deletingLastPathComponent()
        
        if (databaseFolderPath == nil) {
            return
        }

        let fileManager = FileManager.default
       
        if fileManager.fileExists(atPath: databaseFolderPath!.path) {
            
            let fileURLs = try? fileManager.contentsOfDirectory(at: databaseFolderPath!, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for url in fileURLs! {
               try? fileManager.removeItem(at: url)
            }
        }
    }
}
