//
//  NavigationModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 26/12/2022.
//

import Foundation
import SwiftUI

extension Navigation {
    internal class NavigationModel: ObservableObject {
        
        @Published var path: NavigationPath
        
        internal init() {
            path = NavigationPath()
        }
    }
}
