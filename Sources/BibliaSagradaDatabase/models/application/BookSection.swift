//
//  BookSection.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 03/01/25.
//

import Foundation

public struct BookSection {
    public let id: UUID
    public let title: String
    public let type: BookSectionType
    public let bookIDs: [Int]
    
    init(id: UUID = UUID(), title: String, type: BookSectionType, bookIDs: [Int]) {
        self.id = id
        self.title = title
        self.type = type
        self.bookIDs = bookIDs
    }
}

extension BookSection: Identifiable, Hashable, Equatable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func ==(lhs: BookSection, rhs: BookSection) -> Bool {
        lhs.id == rhs.id
    }
    
}
