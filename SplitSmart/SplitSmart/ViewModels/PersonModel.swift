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
    var People: [Person] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Person>(sortBy: [SortDescriptor(\.name)])
            People = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
    }
    
}
