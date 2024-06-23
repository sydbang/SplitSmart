//
//  CreateGroupView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct CreateGroupView: View {
    @Environment(GroupModel.self) var groupModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    
    private var isFormValid: Bool {
        !name.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter Title", text: $name)
                Button("Save") {
                    groupModel.createGroup(name: name)
                    
                    dismiss()
                }.disabled(!isFormValid)
            }
            .navigationTitle("Create Group")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CreateGroupView()
        .modelContainer(for: [Group.self, Expense.self, ExpenseAllocation.self])
}
