//
//  ListsListQueryHandlerTests.swift
//  TaskMan.IntegrationTests
//
//  Created by Shaun Mitchell on 26/12/2022.
//

import CoreData
import Foundation
import TaskMan
import XCTest

extension Lists {
    final class ListQueryHandlerTests : IntegrationTest {
        
        func test_WhenCalled_ReturnsLists() async {
            
            let list1 = TaskList(context: Context)
            list1.name = "ListName1"
            
            let list2 = TaskList(context: Context)
            list2.name = "ListName2"
            
            await insertAsync()
            
            let handler: ListQueryHandler = getService();
            let results = await handler.Handle()
                    
            XCTAssertEqual(2, results.count)
            XCTAssertEqual(list1.name, results[0].name)
            XCTAssertEqual(list2.name, results[1].name)
        }
    }
}


