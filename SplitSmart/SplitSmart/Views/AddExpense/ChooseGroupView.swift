//
//  ChooseGroupView.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI
import SwiftData

struct ChooseGroupView: View {
    @Environment(\.dismiss) private var dismiss

    @Environment(\.modelContext) private var context
    @Query(sort: \Group.id, order: .reverse) private var groups: [Group]
    @Query(sort: \Person.id, order: .reverse) private var person: [Person]
    
    @Binding var withGroup: Group?
    @Binding var withWhom: [Person]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Group")
            Divider()
            ForEach (groups) { group in
                RadioButton(name: group.name, selected: Binding.constant(false))
            }.listStyle(.plain)
            
            Text("Person")
            Divider()
            ForEach (person) { person in
                RadioButton(name: person.name, selected: Binding.constant(false))
            }.listStyle(.plain)
        }
    }
}

#Preview {
    ChooseGroupView(withGroup: Binding.constant(nil), withWhom: Binding.constant([]))
}
