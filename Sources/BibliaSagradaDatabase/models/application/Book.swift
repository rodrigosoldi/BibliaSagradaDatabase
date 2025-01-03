//
//  Book.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

import Foundation

public struct Book {
    public let id: Int
    public let name: String
    public let captions: [Caption]
    
    public init(id: Int, name: String, captions: [Caption]) {
        self.id = id
        self.name = name
        self.captions = captions
    }
}

extension Book: Identifiable { }

extension Book: Hashable, Equatable {
    
    public static func ==(lhs: Book, rhs: Book) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

extension Book {
    
    public func contains(_ text: String) -> Bool {
        let _text = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        return "\(id)".contains(_text) ||
        name.lowercased().contains(_text) ||
        captions.contains(where: { $0.contains(_text) })
    }
    
}
