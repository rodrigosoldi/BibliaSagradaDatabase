//
//  Testament.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

import Foundation

public struct Testament {
    public let id: UUID
    public let name: String
    public let books: [Book]
    
    public init(id: UUID, name: String, books: [Book]) {
        self.id = id
        self.name = name
        self.books = books
    }
}

extension Testament: Identifiable {
    
}

extension Testament: Hashable, Equatable {
    
    public static func ==(lhs: Testament, rhs: Testament) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

extension Testament {
    
    public func contains(_ text: String) -> Bool {
        let _text = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        return id.uuidString.contains(_text) ||
        name.lowercased().contains(_text) ||
        books.contains(where: { $0.contains(_text) })
    }
    
}
