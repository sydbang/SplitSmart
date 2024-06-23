//
//  GroupDetailView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct GroupDetailView: View {
    @State private var addPersonIsPresented: Bool = false

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let group: Group
    
    @Query private var expenses: [Expense]

    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: GroupSettingsView(group: group)) {
                Image(systemName: "gear")
                    .padding()
            }
        }
        
        VStack(alignment: .leading) {
            Text(group.name).font(.title)
            GroupBalanceSummary(group: group)
            HStack {
                Button(action: {}, label: {
                    Text("Settle Up")
                })
                Spacer()
            }.padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
        }.padding()

        VStack(alignment: .leading) {
            HStack {
                Text("Expenses")
                Spacer()
            }.padding()
            ForEach(expenses) { expense in
                Text("expense.id")
            }
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

