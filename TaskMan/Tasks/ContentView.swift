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
        private var tasks : [TaskItem] = []
        private var createHandler : CreateHandler
    
    public init(createHandler: CreateHandler) {
        self.createHandler = createHandler
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        Text("Task at \(task.title)")
                    } label: {
                        Text(task.title)
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
            createHandler.Handle()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(createHandler: CreateHandler(context: PersistenceController.preview.container.viewContext)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
