//
//  ListsDeleteCommandHandlerTests.swift
//  TaskMan.IntegrationTests
//
//  Created by Shaun Mitchell on 26/12/2022.
//

import CoreData
import Foundation
import TaskMan
import XCTest

extension Lists {
    final class DeleteCommandHandlerTests : IntegrationTest {
        
        func test_GivenList_DeletesList() async {
            
            let list = TaskList(context: Context)
            list.name = "Name"
            await insertAsync()
            
            let handler: DeleteCommandHandler = getService();
            await handler.Handle(list: list)
            
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskList")

            let result = try? Context.count(for: fetch)
            
            XCTAssertEqual(0, result)
        }
    }
}



