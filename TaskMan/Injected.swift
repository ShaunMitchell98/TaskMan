//
//  Injected.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 12/11/2022.
//

import Foundation
import Swinject
import SwiftUI

@propertyWrapper
internal struct Injected<TService> {
    
    private var service: TService
    
    public init () {
        let assembler = AssemblerBuilder().Build()
        service = assembler.resolver.resolve(TService.self)!
    }
    
    public var wrappedValue: TService {
        
        get { return service }
    }
}
