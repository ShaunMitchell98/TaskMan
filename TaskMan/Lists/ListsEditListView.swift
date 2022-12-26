//
//  ListsEditListView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 26/12/2022.
//

import Foundation
import SwiftUI

extension Lists {
    
    struct EditListView : View {
        
        @ObservedObject var data: ListData
        var viewModel : ListViewModel
        
        var body : some View {
            
            List(data.items) { list in
                HStack {
                    Text(list.name!)
                    Spacer()
                    Image(systemName: "info.circle")
                        .symbolRenderingMode(.multicolor)
                }
            }
            .task {
                data.items = await viewModel.listAsync()
            }
        }
    }
}
