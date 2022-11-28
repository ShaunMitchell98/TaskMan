//
//  EditModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 12/11/2022.
//

import CoreData
import Foundation

internal class EditViewModel {

    private let editHandler: EditHandler
    
    init(editHandler: EditHandler) {
        self.editHandler = editHandler
    }
    
    func edit(task: TaskItem) {
        editHandler.Handle(request: task)
    }
}
