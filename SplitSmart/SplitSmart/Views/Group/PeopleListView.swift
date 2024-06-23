//
//  PeopleListView.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct PeopleListView: View {
    @Environment(PersonModel.self) var personModel
    
    @State private var isPresented: Bool = false
    
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
            }.padding()

            List {
                ForEach(personModel.people, id: \.id) { person in
                    NavigationLink(value: person) {
                        VStack(alignment: .leading) {
                            Text(person.name)
                                .font(.title3)
                            Text(person.name)
                                .font(.caption)
                        }
                    }
                }.onDelete(perform: personModel.deletePerson)
            }
            .listStyle(.plain)
            .navigationDestination(for: Person.self) { person in
                PersonDetailView(person: person)
            }
        }
        .sheet(isPresented: $isPresented, content: {
            CreatePersonView()
        })
    }
}

#Preview {
    PeopleListView()
}
