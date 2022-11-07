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
    
    init(createHandler: CreateHandler) {
        tasks = []
        self.createHandler = createHandler
    }
    
    func create() {
        createHandler.Handle()
    }
}
