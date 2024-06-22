//
//  GroupDetailView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct GroupDetailView: View {

    @State private var name: String = ""

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let group: Group

    var body: some View {
        Form {
            TextField("Name", text: $name)
            
            ForEach(group.people) { person in
                Text(person.name)
            }
            
            Button("Update") {
                group.name = name

                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }

                dismiss()
            }
        }.onAppear {
            name = group.name
        }
        
        VStack {
            HStack {
                Text("Members")
                Spacer()
                Button("+") {
                    
                }
            }.padding()
        }
        Spacer()
        
    }
}

#Preview {
    let config = ModelConfiguration()
    let container = try! ModelContainer(for: Group.self, configurations: config)
    let group = Group(name: "Group #1")
    
    return GroupDetailView(group: group).modelContainer(container)
}

