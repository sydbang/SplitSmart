//
//  GroupList.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct GroupListView: View {
    let groups: [Group]
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
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Group.self, configurations: config)

    let groups = [Group(name: "Test group")]
    
    return GroupListView(groups: groups).modelContainer(container)
}

