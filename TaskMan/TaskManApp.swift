//
//  TaskManApp.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 05/11/2022.
//

import CoreFoundation
import Foundation
import SwiftUI

@main
struct TaskManApp: App {
            
    var body: some Scene {
        WindowGroup {
            
            Lists.ListView()
                .environment(\.assemblerContainer, AssemblerContainerBuilder.Build())
        }
    }
}
