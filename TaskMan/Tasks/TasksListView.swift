//
//  ContentView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 05/11/2022.
//

import SwiftUI

extension Tasks {
    struct ListView: View {
        @StateObject private var data: ListData = ListData()
        @ObservedObject var navigationModel: Navigation.NavigationModel
        @Injected private var viewModel : ListViewModel

        var body: some View {
            
            List {
                ForEach(data.tasks) { task in
                    NavigationLink(task.name!, value: task)
                }
                .onDelete(perform: { offsets in Task { await deleteItems(offsets: offsets, tasks: data.tasks)}})
            }
            .animation(.default, value: data.tasks)
            .task {
                data.tasks = await viewModel.listAsync()
            }
            .refreshable {
                data.tasks = await viewModel.listAsync()
            }
            .navigationDestination(for: TaskItem.self) { task in
                EditView(task: task, navigationModel: navigationModel)
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

        private func addItem() async {
            
            let task = await viewModel.createAsync(count: data.tasks.count)
            
            withAnimation {
                if task != nil {
                    data.tasks.append(task!)
                }
            }
        }

        private func deleteItems(offsets: IndexSet, tasks: [TaskItem]) async {
            
            for offset in offsets {
                await viewModel.deleteAsync(task: tasks[offset])
            }
            
            withAnimation {
                data.tasks.remove(atOffsets: offsets)
            }
        }
    }


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            
            let configuration = ConfigurationProvider.getConfiguration()
            let assembler = AssemblerBuilder.Build(configuration: configuration)
            assembler.resolver.resolve(ListView.self)
        }
    }
}

