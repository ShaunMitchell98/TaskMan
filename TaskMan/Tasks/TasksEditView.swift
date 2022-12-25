//
//  EditView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 12/11/2022.
//

import CoreData
import SwiftUI

extension Tasks {
    struct EditView: View {
        @ObservedObject var task: TaskItem
        @Binding var navigationStack: [Int]
        @Injected var viewModel : EditViewModel
        @Environment(\.isPresented) var isPresented
        
        var body: some View {
            
            List {
                HStack {
                    Text("Name").bold()
                    Divider()
                    TextField("Name", text: Binding($task.name) ?? .constant(""))
                }
                Toggle("Has Due Date",
                       isOn: Binding(isNotNil: $task.dueDate, defaultValue: Date()))
                if task.dueDate != nil {
                    DatePicker("Due Date", selection: Binding($task.dueDate)!,
                                       displayedComponents: .date)
                }
                Lists.PickerView(selectedList: task.list?.objectID)
            }
            .onChange(of: isPresented) { newValue in
                        if !newValue {
                            viewModel.undo()
                        }
                    }
            .toolbar {
                
                ToolbarItem {
                    Button("Done", action: { Task { await SaveAsync() }})
                }
            }
        }
               
        private func SaveAsync() async {
            await viewModel.editAsync(task: task)
            navigationStack.removeAll()
        }
    }

    struct EditView_Previews: PreviewProvider {
        static var previews: some View {
            
            let configuration = ConfigurationProvider.getConfiguration()
            let assembler = AssemblerBuilder.Build(configuration: configuration)
            assembler.resolver.resolve(EditView.self)
        }
    }
}

