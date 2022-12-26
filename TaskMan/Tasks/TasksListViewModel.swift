//
//  ListModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import Foundation
import SwiftUI

extension Tasks {
    internal class ListViewModel {
            
        private let listQueryHandler: ListQueryHandler
        private let createModelHandler: CreateModelHandler
        private let deleteCommandHandler: DeleteCommandHandler
        
        init(listQueryHandler: ListQueryHandler,
             createModelHandler: CreateModelHandler, deleteCommandHandler: DeleteCommandHandler) {
            
            self.listQueryHandler = listQueryHandler
            self.createModelHandler = createModelHandler
            self.deleteCommandHandler = deleteCommandHandler
        }
        
        func listAsync(listName: String) async -> [TaskItem] {
            return await listQueryHandler.Handle(request: ListQuery(listName: listName))
        }
        
        func createAsync(count: Int, listName: String) async -> TaskItem?  {
            let model = CreateModel(index: count + 1, listName: listName)
            let task = await createModelHandler.Handle(request: model)
            
            return task
        }
        
        @MainActor
        func deleteAsync(task: TaskItem) async {
            
            await deleteCommandHandler.Handle(task: task)
        }
    }
}
