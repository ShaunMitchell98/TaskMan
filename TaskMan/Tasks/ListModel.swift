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
        let task = createHandler.Handle()
        tasks.append(task!)
    }
    
    func delete() {
        deleteHandler.Handle()
    }
}
