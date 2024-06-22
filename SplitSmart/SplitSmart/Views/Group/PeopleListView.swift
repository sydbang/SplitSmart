//
//  PeopleListView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct PeopleListView: View {
    @State private var isPresented: Bool = false
    @Query(sort: \Person.id, order: .reverse) private var people: [Person]
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            HStack {
                Text("People")
                Spacer()
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }

            List {
                ForEach(people, id: \.id) { person in
                    NavigationLink(value: person) {
                        VStack(alignment: .leading) {
                            Text(person.name)
                                .font(.title3)
                            Text(person.name)
                                .font(.caption)
                        }
                    }
                }
            }.navigationDestination(for: Person.self) { person in
                PersonDetailView(person: person)
            }
        }.padding()
        .sheet(isPresented: $isPresented, content: {
            CreatePersonView()
        })
    }
}

#Preview {
    PeopleListView()
}
