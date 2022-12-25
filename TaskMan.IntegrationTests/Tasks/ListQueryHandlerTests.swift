//
//  ListQueryHandlerTests.swift
//  TaskMan.IntegrationTests
//
//  Created by Shaun Mitchell on 24/12/2022.
//

import CoreData
import Foundation
import TaskMan
import XCTest

final class ListQueryHandlerTests : IntegrationTest {
    
    func test_WhenCalled_ReturnsTasks() async {
        
        let task1 = TaskItem(context: Context)
        task1.name = "Name1"
        
        let task2 = TaskItem(context: Context)
        task2.dueDate = Date.now
        task2.name = "Name2"
        
        await insertAsync()
        
        let handler: ListQueryHandler = getService();
        let results = await handler.Handle(request: ListQuery())
                
        XCTAssertEqual(2, results.count)
        XCTAssertEqual(task1.name, results[0].name)
        XCTAssertEqual(task2.name, results[1].name)
        XCTAssertEqual(task2.dueDate, results[1].dueDate)
    }
}
