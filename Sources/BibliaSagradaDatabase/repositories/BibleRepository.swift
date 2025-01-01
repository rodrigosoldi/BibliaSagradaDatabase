//
//  BibleRepository.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 01/01/25.
//  Copyright (c) 2025 Soldi Inc.. All rights reserved.
//
//  This file was generated by Rodrigo Soldi
//

protocol BibleRepository {
    func fetchBible() async throws -> Bible
}

class BibleRepositoryImpl: BibleRepository {

    private typealias K = Constants
    private struct Constants {

    }
    
    private let bibleDatabaseDataSource: BibleDatabaseDataSource
    
    convenience init() throws {
        try self.init(bibleDatabaseDataSource: BibleDatabaseDataSourceImpl())
    }
    
    init(bibleDatabaseDataSource: BibleDatabaseDataSource) throws {
        self.bibleDatabaseDataSource = bibleDatabaseDataSource
    }

    func fetchBible() async throws -> Bible {
        try await bibleDatabaseDataSource.fetchBible()
    }

}
