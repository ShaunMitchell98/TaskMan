//
//  NavigationModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 15/11/2022.
//

import Foundation
import SwiftUI

internal class NavigationModel : ObservableObject {
    
    @Published var path: [TaskItem] = []
}
