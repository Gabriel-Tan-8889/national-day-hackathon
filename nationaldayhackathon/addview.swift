//
//  addview.swift
//  nationaldayhackathon
//
//  Created by Jonaven Tan on 26/8/23.
//

import SwiftUI

struct person: View {
    
    @State private var personName: String
    
    
    var body: some View {
        Form {
            Section("Info") {
                TextField("Person's name", text: $personName)
                
            }
            
            Section("Actions") {
                Button("Save") {
                    let newPerson = Todo(Name: todoPersonName, )
                    sourceArray.append(newTodo)
                    dismiss()
                }
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

