//
//  Injected.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 12/11/2022.
//

import Foundation
import SwiftUI

@propertyWrapper
internal struct Injected<TService> : DynamicProperty {
    
    @Environment(\.assemblerContainer) private var assemblerContainer: AssemblerContainer?
    
    public var wrappedValue: TService {
        
        get { return assemblerContainer!.assembler.resolver.resolve(TService.self)! }
    }
}
