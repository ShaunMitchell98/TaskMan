//
//  DeleteCommandHandlerTests.swift
//  TaskMan.IntegrationTests
//
//  Created by Shaun Mitchell on 24/12/2022.
//

import CoreData
import Foundation
import TaskMan
import XCTest

final class DeleteCommandHandlerTests : IntegrationTest {
    
    func test_GivenTask_DeletesTask() async {
        
        let task = TaskItem(context: Context)
        task.name = "Name"
        await insertAsync()
        
        let handler: DeleteCommandHandler = getService();
        await handler.Handle(task: task)
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskItem")

        let result = try? Context.count(for: fetch)
        
        XCTAssertEqual(0, result)
    }
}

