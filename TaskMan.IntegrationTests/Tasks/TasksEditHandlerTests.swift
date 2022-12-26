//
//  EditHandlerTests.swift
//  TaskMan.IntegrationTests
//
//  Created by Shaun Mitchell on 24/12/2022.
//

import CoreData
import Foundation
import TaskMan
import XCTest

extension Tasks {
    final class EditHandlerTests : IntegrationTest {
        
        func test_GivenTask_EditsTask() async {
            
            let task = TaskItem(context: Context)
            task.name = "Name"
            await insertAsync()
            
            let newName = "New Name"
            let newDate = Date.now
            task.name = newName
            task.dueDate = newDate
            
            let handler: EditHandler = getService();
            await handler.Handle(request: task)
            
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskItem")

            let result = Context.fetchResults(request: fetch)
            let finalTask = (result as! [TaskItem])[0]
            
            XCTAssertEqual(newName, finalTask.name)
            XCTAssertEqual(newDate, finalTask.dueDate)
        }
    }
}

