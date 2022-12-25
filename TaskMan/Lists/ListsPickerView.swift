//
//  PickerView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import CoreData
import Foundation
import SwiftUI

extension Lists {
    struct PickerView: View {
        
        @Binding var selectedList: TaskList?
        @State var lists: [TaskList] = []
        @Injected private var viewModel : PickerViewModel
        
        var body: some View {
            
            Picker("List", selection: Binding($selectedList)!.name) {
                ForEach(lists) { list in
                    Text(list.name!).tag(list.name)
                }
            }
            .task {
                lists = await viewModel.listAsync()
            }
        }
    }

    struct PickerView_Previews: PreviewProvider {
        static var previews: some View {
            
            let configuration = ConfigurationProvider.getConfiguration()
            let assembler = AssemblerBuilder.Build(configuration: configuration)
            assembler.resolver.resolve(PickerView.self)
        }
    }
}
