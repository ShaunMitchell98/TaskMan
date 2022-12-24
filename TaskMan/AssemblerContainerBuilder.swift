//
//  AssemblerContainerBuilder.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 24/12/2022.
//

import Foundation

class AssemblerContainerBuilder {
    
    static func Build() -> AssemblerContainer {
        
        let configuration = ConfigurationProvider.getConfiguration()
        
        let assembler = AssemblerBuilder.Build(configuration: configuration)
        
        return AssemblerContainer(assembler: assembler)
    }
}
