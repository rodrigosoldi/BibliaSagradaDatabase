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

final class BibleDatabaseDataSourceImpl: BibleDatabaseDataSource {
    
    private let databaseManager: DatabaseManager
    private let wrapper: Wrapper
    
    convenience init() throws {
        try self.init(
            wrapper: WrapperImpl(),
            databaseManager: DatabaseManagerImpl())
    }
    
    init(wrapper: Wrapper, databaseManager: DatabaseManager) throws {
        self.wrapper = wrapper
        self.databaseManager = databaseManager
    }

    func fetchBible() async throws -> Bible {
        let testaments = try await databaseManager.fetchObjects(DBTestament.self)
        
        guard testaments.count == 2 else {
            throw BSError.unableToFetchBible
        }
        
        let dbBible = DBBible(
            oldTestament: testaments[0],
            newTestament: testaments[1])
        let bible = wrapper.map(dbBible)
        return bible
    }
    
}
