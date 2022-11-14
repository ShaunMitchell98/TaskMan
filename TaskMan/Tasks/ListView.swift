//
//  ContentView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 05/11/2022.
//

import SwiftUI
import CoreData

struct ListView: View {
    @State var tasks: [TaskItem]
    @Injected var viewModel : ListViewModel

    var body: some View {
        
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        EditView(task: task)
                    }
                    label: {
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
        }
    }

    private func addItem() {
        withAnimation {
            let task = viewModel.create(count: tasks.count)
            
            if task != nil {
                tasks.append(task!)
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            
            for offset in offsets {
                viewModel.delete(task: tasks[offset])
            }
            
            tasks.remove(atOffsets: offsets)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let assembler = AssemblerBuilder().Build()
        assembler.resolver.resolve(ListView.self)
    }
}
