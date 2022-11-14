//
//  EditView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 12/11/2022.
//

import CoreData
import SwiftUI

struct EditView: View {
    @State var task: TaskItem
    @Injected var viewModel : EditViewModel
    
    var body: some View {
        Text(task.name ?? "Nothing")
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        
        let assembler = AssemblerBuilder().Build()
        assembler.resolver.resolve(EditView.self)
    }
}
