//
//  GroupList.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct GroupListView: View {
    @State private var isPresented: Bool = false
    @Query(sort: \Group.id, order: .reverse) private var groups: [Group]
    
    @Environment(\.modelContext) private var context
    private func deleteTodo(indexSet: IndexSet) {
        indexSet.forEach { index in
            let todo = groups[index]
            context.delete(todo)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    var body: some View {
        VStack {
            HStack {
                Text("Groups")
                Spacer()
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }

            List {
                ForEach(groups, id: \.id) { group in
                    NavigationLink(value: group) {
                        VStack(alignment: .leading) {
                            Text(group.name)
                                .font(.title3)
                            Text(group.name)
                                .font(.caption)
                        }
                    }
                }.onDelete(perform: deleteTodo)
            }.navigationDestination(for: Group.self) { group in
                GroupDetailView(group: group)
            }
        }
        .sheet(isPresented: $isPresented, content: {
            CreateGroupView()
        })
    }
}

#Preview {
    GroupListView()
        .modelContainer(for: [Group.self, Expense.self, ExpenseAllocation.self])
}

