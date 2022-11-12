//
//  ListModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import Foundation

public class ListModel : ObservableObject {
    @Published var tasks : [ListItemModel]
    private let createModelHandler: CreateModelHandler
    private let deleteCommandHandler: DeleteCommandHandler
    
    init(createModelHandler: CreateModelHandler, deleteCommandHandler: DeleteCommandHandler, listQueryHandler: ListQueryHandler) {
        let query = ListQuery()
        tasks = listQueryHandler.Handle(request: query)
        self.createModelHandler = createModelHandler
        self.deleteCommandHandler = deleteCommandHandler
    }
    
    func create() {
        let model = CreateModel(index: tasks.count + 1)
        let task = createModelHandler.Handle(request: model)
        
        if (task == nil) {
            return
        }
        
        tasks.append(ListItemModel(id: task!.objectID, name: task!.name))
    }
    
    func delete(offsets: IndexSet) {
        
        for index in offsets {
            let task = tasks[index]
            deleteCommandHandler.Handle(command: DeleteCommand(id: task.id))
        }

        tasks.remove(atOffsets: offsets)
    }
}
