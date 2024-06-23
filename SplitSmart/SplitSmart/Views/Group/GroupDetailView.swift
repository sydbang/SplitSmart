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

    @State private var name: String = ""

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let group: Group

    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: GroupSettingsView(group: group)) {
                Image(systemName: "gear")
                    .padding()
            }
        }

        VStack {
            HStack {
                Text("Expenses")
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

