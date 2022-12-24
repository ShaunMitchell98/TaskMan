//
//  CreateModelHandlerTests.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 24/12/2022.
//

import Foundation
import XCTest
import TaskMan

final class CreateModelHandlerTests : IntegrationTest {
    
    func test_GivenTask_SavesTask() async {
        
        let model = CreateModel(index: 5)
        
        let handler: CreateModelHandler = getService();
        let result = await handler.Handle(request: model)
        
        XCTAssertEqual("Temp 5", result?.name!)
    }
}

