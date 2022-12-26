//
//  ListView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 05/11/2022.
//

import SwiftUI

extension Lists {
    struct ListView: View {
        @State private var editMode: EditMode = .inactive // Hack because of SwiftUI bug, see https://medium.com/geekculture/swiftui-and-the-intermittent-editmode-b714c923f536
        @StateObject private var data: ListData = ListData()
        @StateObject private var navigationModel: Navigation.NavigationModel = Navigation.NavigationModel()
        @Injected private var viewModel : ListViewModel

        var body: some View {
            
            NavigationStack(path: $navigationModel.path) {
                
                Group {
                    if (editMode.isEditing == true) {
                        EditListView(data: data, viewModel: viewModel)
                    }
                    else {
                        NavigationView(data: data, navigationModel: navigationModel, viewModel: viewModel)
                    }
                }

                .animation(.default, value: data.items)

                .navigationTitle("Lists")
                .toolbar {
    #if os(iOS)
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
    #endif
                    ToolbarItem {
                        Button(action: { Task { await addItem()}}) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                .environment(\.editMode, $editMode)
            }
        }

        private func addItem() async {
            
            let task = await viewModel.createAsync(count: data.items.count)
            
            withAnimation {
                if task != nil {
                    data.items.append(task!)
                }
            }
        }
    }
}
