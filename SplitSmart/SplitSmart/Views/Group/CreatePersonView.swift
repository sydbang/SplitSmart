//
//  CreatePersonView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct CreatePersonView: View {
    @Environment(PersonModel.self) var personModel
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    
    
    private var isFormValid: Bool {
        !name.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter Name", text: $name)
                Button("Save") {
                    personModel.createPerson(name: name)
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
