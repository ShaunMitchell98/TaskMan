//
//  TaskManApp.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 05/11/2022.
//

import SwiftUI

@main
struct TaskManApp: App {
    
    let assembler = AssemblerBuilder().Build()

    var body: some Scene {
        WindowGroup {
    
            let assemblerContainer = AssemblerContainer(assembler: assembler)
            ListView()
                .environment(\.assemblerContainer, assemblerContainer)
        }
    }
}
