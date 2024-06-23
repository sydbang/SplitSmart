//
//  AddPersonToGroup.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct AddPersonToGroupView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Person.id, order: .reverse) private var allPeople: [Person]
    
    var group: Group
    @Binding var isPresented: Bool
    
    @State var selectedPeople: [Person: Bool] = [:]

    func initializeSelectedPeople() {
        for person in allPeople {
            if selectedPeople[person] == nil {
                selectedPeople[person] = false
            }
        }
    }
    
    var body: some View {
        HStack {
            Spacer()
            Button("Add") {
                addSelectedPeople()
                isPresented = false
            }
        }.padding()
        List {
            ForEach(allPeople) { person in
                if (!group.people.contains(person)) {
                    HStack {
                        Text(person.name).onTapGesture {
                            addPersonToGroup(person: person)
                        }
                        Toggle("", isOn: Binding(
                            get: { self.selectedPeople[person, default: false] },
                            set: { newValue in self.selectedPeople[person] = newValue }
                        ))
                    }
                }
            }
        }
        .listStyle(.plain)
        .onAppear {
            initializeSelectedPeople()
        }
        
    }
    
    func addPersonToGroup(person: Person) {
        group.people.append(person)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addSelectedPeople() {
        for (person, selected) in selectedPeople {
            if selected {
                group.people.append(person)
            }
        }
        try! context.save()
    }
}


//#Preview {
//    let config = ModelConfiguration()
//    let container = try! ModelContainer(for: Group.self, configurations: config)
//    let group = Group(name: "Group #1")
//
//    return AddPersonToGroupView(group: group, isPresented: Binding<Bool>(true)).modelContainer(container)
//}
