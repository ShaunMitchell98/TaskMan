//
//  ContentView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 05/11/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
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
            //offsets.map { viewModel.tasks[$0] //}.forEach(viewContext.delete)

            viewModel.delete(offsets: offsets)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ListModel(createHandler: CreateHandler(context: PersistenceController.preview.container.viewContext),
                    deleteHandler: DeleteHandler(context: PersistenceController.preview.container.viewContext),
                                         listQueryHandler: ListQueryHandler(context: PersistenceController.preview.container.viewContext))).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
