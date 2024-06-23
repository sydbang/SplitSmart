//
//  GroupModel.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import Foundation
import SwiftData

@Observable
class GroupModel {
    var modelContext: ModelContext
    var groups = [Group]()
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Group>(sortBy: [SortDescriptor(\.id)])
            groups = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
    }
    
    func createGroup(name: String) {
        let todo = Group(name: name)
        modelContext.insert(todo)
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
        fetchData()
    }
    
    func deleteGroup(indexSet: IndexSet) {
        indexSet.forEach { index in
            let group = groups[index]
            modelContext.delete(group)
            do {
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
