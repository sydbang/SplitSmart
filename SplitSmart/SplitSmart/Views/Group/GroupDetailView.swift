//
//  GroupDetailView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI

struct GroupDetailView: View {

    @State private var name: String = ""

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let group: Group

    var body: some View {
        Form {
            TextField("Name", text: $name)

            Button("Update") {
                group.name = name

                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }

                dismiss()
            }
        }.onAppear {
            name = group.name
        }
    }
}

