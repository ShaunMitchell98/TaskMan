//
//  CreateModelHandlerTests.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 24/12/2022.
//

import Foundation
import XCTest
import TaskMan

extension Tasks {
    final class CreateModelHandlerTests : IntegrationTest {
        
        func test_GivenTask_SavesTask() async {
                    
            let list = TaskList(context: Context)
            list.name = "ListName"
            await insertAsync()
            
            let model = CreateModel(index: 5, listName: list.name!)
            
            let handler: CreateModelHandler = getService();
            let result = await handler.Handle(request: model)
            
            XCTAssertEqual("Temp 5", result!.name!)
            XCTAssertEqual(list.name, result!.list!.name)
        }
    }
}


