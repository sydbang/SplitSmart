//
//  AddExpenseWithView.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI

struct AddExpenseWithView: View {
    @Binding var withGroup: [Group]
    @Binding var withWhom: [Person]

    var body: some View {
        HStack {
            Text("With you and: ")
            ForEach (withGroup, id:\.id) { group in
                GroupBubble(name: group.name, isGroup: true)
            }
            ForEach (withWhom, id:\.id) { person in
                GroupBubble(name: person.name, isGroup: false)
            }
        }
    }
}

#Preview {
    AddExpenseWithView(withGroup: Binding.constant([]), withWhom: Binding.constant([]))
}
