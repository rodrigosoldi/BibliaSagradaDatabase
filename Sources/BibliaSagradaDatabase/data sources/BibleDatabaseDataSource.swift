//
//  BibleDatabaseDataSource.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 01/01/25.
//

import Foundation
import RealmSwift

protocol BibleDatabaseDataSource {
    func fetchBible() async throws -> Bible
}

final class BibleDatabaseDataSourceImpl: BibleDatabaseDataSource, @unchecked Sendable {
    
    private let databaseManager: DatabaseManager
    private let bibleWrapper: any Wrapper<[DBTestament], Bible>
    
    convenience init() throws {
        try self.init(
            wrapper: BibleWrapper())
    }
    
    init(wrapper: any Wrapper<[DBTestament], Bible>) throws {
        self.bibleWrapper = wrapper
        self.databaseManager = try DatabaseManagerImpl()
    }

    func fetchBible() async throws -> Bible {
        try await databaseManager.fetchObject(DBTestament.self, wrapper: bibleWrapper)        
    }
    
}
