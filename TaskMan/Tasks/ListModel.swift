//
//  ListModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import Foundation

public class ListModel : ObservableObject {
    @Published var tasks : [TaskItem]
    private let createHandler: CreateHandler
    private let deleteHandler: DeleteHandler
    
    init(createHandler: CreateHandler, deleteHandler: DeleteHandler) {
        tasks = []
        self.createHandler = createHandler
        self.deleteHandler = deleteHandler
    }
    
    func create() {
        let task = createHandler.Handle(index: tasks.count + 1)
        tasks.append(task!)
    }
    
    func delete(offsets: IndexSet) {
        
        for index in offsets {
            let task = tasks[index]
            deleteHandler.Handle(taskItem: task)
        }

        tasks.remove(atOffsets: offsets)
    }
}
