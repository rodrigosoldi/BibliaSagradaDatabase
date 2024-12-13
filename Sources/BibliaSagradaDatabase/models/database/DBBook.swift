//
//  Book.swift
//  BibliaSagradaAveMariaDatabaseBuilder
//
//  Created by Rodrigo Soldi on 13/12/24.
//

import RealmSwift
import Foundation

class DBBook: Object {
    
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var name: String
    @Persisted var captions: List<DBCaption>
    
}
