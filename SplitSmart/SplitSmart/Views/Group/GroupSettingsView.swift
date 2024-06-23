//
//  GroupSettingsView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct GroupSettingsView: View {
    @State private var addPersonIsPresented: Bool = false
    
    @Environment(\.modelContext) private var context
    
    var group: Group
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Members")
                Spacer()
                Button {
                    addPersonIsPresented = true
                } label: {
                    Image(systemName: "plus")
                }.sheet(isPresented: $addPersonIsPresented) {
                    AddPersonToGroupView(group: group, isPresented: $addPersonIsPresented)
                }
            }.padding()
            
            ForEach(group.people) { person in
                Text(person.name)
            }.padding()

            HStack {
                Text("Simplify Debts")
                Toggle("", isOn: Binding(
                    get: { group.simplifyDebts },
                    set: { newValue in
                        group.simplifyDebts = newValue
                        try! context.save()
                    }
                ))
            }.padding()
            
            Spacer()
        }
        .navigationTitle("Group Settings")
    }
    
}

#Preview {
    let config = ModelConfiguration()
    let container = try! ModelContainer(for: Group.self, configurations: config)
    let group = Group(name: "Group #1")
    
    return GroupSettingsView(group: group)
}
