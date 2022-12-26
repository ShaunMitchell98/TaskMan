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

extension Tasks {
    final class ListQueryHandlerTests : IntegrationTest {
        
        func test_WhenCalled_ReturnsTasks() async {
            
            let list1 = TaskList(context: Context)
            list1.name = "ListName1"
            
            let list2 = TaskList(context: Context)
            list2.name = "ListName2"
            
            let task1 = TaskItem(context: Context)
            task1.name = "Name1"
            task1.list = list1
            
            let task2 = TaskItem(context: Context)
            task2.dueDate = Date.now
            task2.name = "Name2"
            task2.list = list1
            
            let task3 = TaskItem(context: Context)
            task3.name = "Name3"
            task3.list = list2
            
            await insertAsync()
            
            let handler: ListQueryHandler = getService();
            let results = await handler.Handle(request: ListQuery(listName: list1.name!))
                    
            XCTAssertEqual(2, results.count)
            XCTAssertEqual(task1.name, results[0].name)
            XCTAssertEqual(task2.name, results[1].name)
            XCTAssertEqual(task2.dueDate, results[1].dueDate)
        }
    }
}

