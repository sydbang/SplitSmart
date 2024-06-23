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

    @Environment(GroupModel.self) var groupModel
    
//    @Environment(\.modelContext) private var context
    
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
            }.padding()

            List {
                ForEach(groupModel.groups, id: \.id) { group in
                    NavigationLink(value: group) {
                        VStack(alignment: .leading) {
                            Text(group.name)
                                .font(.title3)
                            Text(group.name)
                                .font(.caption)
                        }
                    }
                }//.onDelete(perform: deleteGroup)
            }
            .listStyle(.plain)
            .navigationDestination(for: Group.self) { group in
                GroupDetailView(group: group)
            }
        }
        .sheet(isPresented: $isPresented, content: {
            CreateGroupView()
        })
    }
    
//    private func deleteGroup(indexSet: IndexSet) {
//        indexSet.forEach { index in
//            let group = groupModel.groups[index]
//            context.delete(group)
//            do {
//                try context.save()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
}

#Preview {
    GroupListView()
        .modelContainer(for: [Group.self, Expense.self, ExpenseAllocation.self])
}

