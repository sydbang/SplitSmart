//
//  ModelContext +.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import Foundation
import SwiftData

extension ModelContext {
    var sqliteCommand: String {
        if let url = container.configurations.first?.url.path(percentEncoded: false) {
            "sqlite3 \"\(url)\""
        } else {
            "No SQLite database found."
        }
    }
}
