//
//  ListModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import CoreData
import Foundation

internal class ListViewModel {
        
    private let createModelHandler: CreateModelHandler
    private let deleteCommandHandler: DeleteCommandHandler
    
    init(createModelHandler: CreateModelHandler, deleteCommandHandler: DeleteCommandHandler) {
        
        self.createModelHandler = createModelHandler
        self.deleteCommandHandler = deleteCommandHandler
    }
    
    func create(count: Int) -> TaskItem?  {
        let model = CreateModel(index: count + 1)
        let task = createModelHandler.Handle(request: model)
        
        return task
    }
    
    func delete(task: TaskItem) {
        
        deleteCommandHandler.Handle(task: task)
        
    }
}
