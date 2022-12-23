//
//  ListData.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 23/12/2022.
//

import Foundation
import SwiftUI

@MainActor 
class ListData : ObservableObject {
    
    @Published var tasks: [TaskItem] = []
}
