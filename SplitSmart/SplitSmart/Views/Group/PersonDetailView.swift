//
//  PersonDetailView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct PersonDetailView: View {

    @State private var name: String = ""

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let person: Person

    var body: some View {
        Form {
            TextField("Name", text: $name)

            Button("Update") {
                person.name = name

                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }

                dismiss()
            }
        }.onAppear {
            name = person.name
        }
        
    }
}

#Preview {
    let config = ModelConfiguration()
    let container = try! ModelContainer(for: Person.self, configurations: config)
    let person = Person(name: "Max")
    
    return PersonDetailView(person: person).modelContainer(container)
}

