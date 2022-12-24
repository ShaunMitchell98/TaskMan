//
//  EditHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 14/11/2022.
//

import Foundation

public class EditHandler {
    
    let context : TaskManContext;
    
    public init(context : TaskManContext)
    {
        self.context = context;
    }
    
    public func Handle(request: TaskItem) async {
        
        await context.perform {
            self.context.saveChanges()
        }
    }
}
