//
//  ListView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 05/11/2022.
//

import SwiftUI

extension Lists {
    struct ListView: View {
        @StateObject private var data: ListData = ListData()
        @StateObject private var navigationModel: Navigation.NavigationModel = Navigation.NavigationModel()
        @Injected private var viewModel : ListViewModel

        var body: some View {
            
            NavigationStack(path: $navigationModel.path) {
                List {
                    ForEach(data.items) { list in
                        NavigationLink(list.name!, value: list)
                    }
                    .onDelete(perform: { offsets in Task { await deleteItems(offsets: offsets, lists: data.items)}})
                }
                .animation(.default, value: data.items)
                .task {
                    data.items = await viewModel.listAsync()
                }
                .refreshable {
                    data.items = await viewModel.listAsync()
                }
                .navigationDestination(for: TaskList.self) { list in
                    Tasks.ListView(navigationModel: navigationModel)
                }
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
        
        private func deleteItems(offsets: IndexSet, lists: [TaskList]) async {
            
            for offset in offsets {
                await viewModel.deleteAsync(list: lists[offset])
            }
            
            withAnimation {
                data.items.remove(atOffsets: offsets)
            }
        }
    }


    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            
            let configuration = ConfigurationProvider.getConfiguration()
            let assembler = AssemblerBuilder.Build(configuration: configuration)
            assembler.resolver.resolve(ListView.self)
        }
    }
}


