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
}
