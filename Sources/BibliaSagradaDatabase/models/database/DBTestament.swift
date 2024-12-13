//
//  Testament.swift
//  BibliaSagradaAveMariaDatabaseBuilder
//
//  Created by Rodrigo Soldi on 13/12/24.
//

import RealmSwift
import Foundation

class DBTestament: Object {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var name: String
    @Persisted var books: List<DBBook>
}
