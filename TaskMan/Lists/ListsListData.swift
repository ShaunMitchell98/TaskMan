//
//  ListData.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import Foundation

extension Lists {
    @MainActor
    class ListData : ObservableObject {
        
        @Published var items: [TaskList] = []
    }
}
