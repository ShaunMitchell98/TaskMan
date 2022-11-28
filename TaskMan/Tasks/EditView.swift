//
//  EditView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 12/11/2022.
//

import CoreData
import SwiftUI

struct EditView: View {
    @Binding var task: TaskItem
    @Binding var navigationStack: [Int]
    @Injected var viewModel : EditViewModel
    
    var body: some View {
        
        List {
            HStack {
                Text("Name").bold()
                Divider()
                TextField("Name", text: Binding($task.name) ?? .constant(""))
            }
        }
        .toolbar {
            
            ToolbarItem {
                Button("Done", action: Save)
            }
        }
    }
                    
    private func Save() {
        viewModel.edit(task: task)
        navigationStack.removeAll()
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        
        let assembler = AssemblerBuilder().Build()
        assembler.resolver.resolve(EditView.self)
    }
}
