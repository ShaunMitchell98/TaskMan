//
//  ContentView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 05/11/2022.
//

import SwiftUI
import CoreData

struct ListView: View {
    @ObservedObject var viewModel : ListModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    NavigationLink {
                        Text("Task at \(task.name!)")
                    } label: {
                        Text(task.name!)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            viewModel.create()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            viewModel.delete(offsets: offsets)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let assembler = AssemblerBuilder().Build()
        ListView(viewModel: assembler.resolver.resolve(ListModel.self)!)
    }
}
