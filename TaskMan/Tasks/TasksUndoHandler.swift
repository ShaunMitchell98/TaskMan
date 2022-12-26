//
//  UndoHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 23/12/2022.
//

import Foundation

extension Tasks {
    internal class UndoHandler {
        
        let context : TaskManContext;
        
        internal init(context : TaskManContext)
        {
            self.context = context;
        }
        
        internal func Handle() {
            
            context.rollback()
        }
    }
}

