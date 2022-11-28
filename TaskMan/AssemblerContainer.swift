//
//  AssemblerContainer.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 28/11/2022.
//

import Foundation
import Swinject
import SwiftUI


internal class AssemblerContainer : ObservableObject {
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    internal var assembler: Assembler
}

struct AssemblerKey: EnvironmentKey {
    static let defaultValue: AssemblerContainer? = nil
}

extension EnvironmentValues {
    var assemblerContainer: AssemblerContainer? {
        get {
            self[AssemblerKey.self]
        }
        set {
            self[AssemblerKey.self] = newValue
            
        }
    }
}
