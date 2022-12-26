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
                NavigationView(data: data, navigationModel: navigationModel, viewModel: viewModel)
                .animation(.default, value: data.items)
                .refreshable {
                    data.items = await viewModel.listAsync()
                }
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

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            
            let configuration = ConfigurationProvider.getConfiguration()
            let assembler = AssemblerBuilder.Build(configuration: configuration)
            assembler.resolver.resolve(ListView.self)
        }
    }
}


