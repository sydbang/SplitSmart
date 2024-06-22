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
    
    var body: some View {
        List {
            ForEach(allPeople) { person in
                if (!group.people.contains(person)) {
                    Text(person.name).onTapGesture {
                        addPersonToGroup(person: person)
                        
                    }
                }
            }
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
}


#Preview {
    let config = ModelConfiguration()
    let container = try! ModelContainer(for: Group.self, configurations: config)
    let group = Group(name: "Group #1")

    return AddPersonToGroupView(group: group).modelContainer(container)
}
