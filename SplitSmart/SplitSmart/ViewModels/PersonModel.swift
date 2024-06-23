//
//  PersonModel.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import Foundation
import SwiftData

@Observable
class PersonModel {
    var modelContext: ModelContext
    var people: [Person] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Person>(sortBy: [SortDescriptor(\.name)])
            people = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
    }
    
    func createPerson(name: String) {
        let person = Person(name: name)
        modelContext.insert(person)
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
        fetchData()
    }
    
    func deletePerson(indexSet: IndexSet) {
        indexSet.forEach { index in
            let person = people[index]
            modelContext.delete(person)
            do {
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
