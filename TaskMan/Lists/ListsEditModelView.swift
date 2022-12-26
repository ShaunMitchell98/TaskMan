//
//  ListsEditModelView.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 26/12/2022.
//

import Foundation
import SwiftUI  

extension Lists {
    
    struct EditModalView : View {
        
        @Binding var isPresented: Bool
        @State var text: String = ""
        
        var body: some View {
            List {
                HStack {
                    Text("Name").bold()
                    Divider()
                    TextField("Name", text: $text)
                }
                Button("Dismiss",
                                     action: { isPresented.toggle() })
            }
        }
    }
}
