//
//  ListViewModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import Foundation

extension Lists {
    internal class ListViewModel {
            
        private let listQueryHandler: ListQueryHandler
        private let createModelHandler: CreateModelHandler
        private let deleteCommandHandler: DeleteCommandHandler
        
        init(listQueryHandler: ListQueryHandler,
             createModelHandler: CreateModelHandler,
             deleteCommandHandler: DeleteCommandHandler) {
            
            self.listQueryHandler = listQueryHandler
            self.createModelHandler = createModelHandler
            self.deleteCommandHandler = deleteCommandHandler
        }
        
        func listAsync() async -> [TaskList] {
            return await listQueryHandler.Handle()
        }
        
        func createAsync(count: Int) async -> TaskList?  {

            return await createModelHandler.Handle(request: CreateModel(index: count + 1))
        }
        
        func deleteAsync(list: TaskList) async {
            
            await deleteCommandHandler.Handle(list: list)
        }
    }
}
