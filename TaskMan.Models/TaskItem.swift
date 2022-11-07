//
//  TaskItem.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import CoreData
import Foundation

public class TaskItem : NSManagedObject, Identifiable {
    @NSManaged var title : String;
}
