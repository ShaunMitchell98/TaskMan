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
        
        init(listQueryHandler: ListQueryHandler,
             createModelHandler: CreateModelHandler) {
            
            self.listQueryHandler = listQueryHandler
            self.createModelHandler = createModelHandler
        }
        
        func listAsync() async -> [TaskList] {
            return await listQueryHandler.Handle()
        }
        
        func createAsync(count: Int) async -> TaskList?  {

            return await createModelHandler.Handle(request: CreateModel(index: count + 1))
        }
    }
}
