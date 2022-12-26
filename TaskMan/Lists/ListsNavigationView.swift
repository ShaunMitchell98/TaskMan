//
//  ListsNavigationView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 26/12/2022.
//

import Foundation
import SwiftUI

extension Lists {
    
    struct NavigationView : View {
        
        @ObservedObject var data: ListData
        @ObservedObject var navigationModel: Navigation.NavigationModel
        var viewModel : ListViewModel
        
        var body : some View {
            
            List {
                ForEach(data.items) { list in
                    NavigationLink(list.name!, value: list)
                }
                .onDelete(perform: { offsets in Task { await deleteItems(offsets: offsets, lists: data.items)}})
            }
            .navigationDestination(for: TaskList.self) { list in
                Tasks.ListView(listName: list.name!, navigationModel: navigationModel)
            }
            .task {
                data.items = await viewModel.listAsync()
            }
        }
        
        private func deleteItems(offsets: IndexSet, lists: [TaskList]) async {
            
            for offset in offsets {
                await viewModel.deleteAsync(list: lists[offset])
            }
            
            withAnimation {
                data.items.remove(atOffsets: offsets)
            }
        }
    }
}
