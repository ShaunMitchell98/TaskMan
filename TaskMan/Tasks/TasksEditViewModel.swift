//
//  EditModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 12/11/2022.
//

import CoreData
import Foundation

extension Tasks {
    internal class EditViewModel {

        private let editHandler: EditHandler
        private let undoHandler: UndoHandler
        
        init(editHandler: EditHandler, undoHandler: UndoHandler) {
            self.editHandler = editHandler
            self.undoHandler = undoHandler
        }
        
        func editAsync(task: TaskItem) async {
            await editHandler.Handle(request: task)
        }
        
        func undo() {
            undoHandler.Handle()
        }
    }
}

