//
//  AssemblerBuilder.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 10/11/2022.
//

import Foundation
import Swinject

public class AssemblerBuilder {
    
    public static func Build(configuration: NSDictionary) -> Assembler {
        return Assembler([DataAccessAssembly(configuration: configuration), TasksAssembly()])
    }
}
