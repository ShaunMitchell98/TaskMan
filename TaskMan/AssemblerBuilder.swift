//
//  AssemblerBuilder.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 10/11/2022.
//

import Foundation
import Swinject

internal class AssemblerBuilder {
    
    internal func Build(configuration: NSDictionary) -> Assembler {
        return Assembler([DataAccessAssembly(configuration: configuration), TasksAssembly()])
    }
}
