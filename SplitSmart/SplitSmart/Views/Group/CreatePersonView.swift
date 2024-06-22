//
//  CreatePersonView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct CreatePersonView: View {
    @State private var name = ""
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    private var isFormValid: Bool {
        !name.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter Name", text: $name)
                Button("Save") {
                    let todo = Person(name: name)
                    context.insert(todo)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }.disabled(!isFormValid)
            }
            .navigationTitle("Create Person")
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
    CreatePersonView()
        .modelContainer(for: [Person.self])
}
