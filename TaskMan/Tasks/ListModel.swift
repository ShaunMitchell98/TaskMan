//
//  ListModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import Foundation

public class ListModel : ObservableObject {
    @Published var tasks : [ListItemModel]
    private let createHandler: CreateHandler
    private let deleteHandler: DeleteHandler
    
    init(createHandler: CreateHandler, deleteHandler: DeleteHandler, listQueryHandler: ListQueryHandler) {
        let query = ListQuery()
        tasks = listQueryHandler.Handle(request: query)
        self.createHandler = createHandler
        self.deleteHandler = deleteHandler
    }
    
    func create() {
        let model = CreateModel(index: tasks.count + 1)
        let task = createHandler.Handle(request: model)
        
        if (task == nil) {
            return
        }
        
        tasks.append(ListItemModel(id: task!.objectID, name: task!.name))
    }
    
    func delete(offsets: IndexSet) {
        
        for index in offsets {
            let task = tasks[index]
            deleteHandler.Handle(command: DeleteCommand(id: task.id))
        }

        tasks.remove(atOffsets: offsets)
    }
}
