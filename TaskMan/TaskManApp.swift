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
            ContentView(viewModel: assembler.resolver.resolve(ListModel.self)!)
        }
    }
}
