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
    func fetchBooks(booksIDs: [Int]) async throws -> [Book]
}

final class BibleDatabaseDataSourceImpl: BibleDatabaseDataSource, @unchecked Sendable {
    
    private let databaseManager: DatabaseManager
    private let bibleWrapper: any Wrapper<[DBTestament], Bible>
    private let bookWrapper: any Wrapper<DBBook, Book>
    
    convenience init() throws {
        try self.init(
            wrapper: BibleWrapper(), bookWrapper: BookWrapper())
    }
    
    init(wrapper: any Wrapper<[DBTestament], Bible>, bookWrapper: any Wrapper<DBBook, Book>) throws {
        self.bibleWrapper = wrapper
        self.bookWrapper = bookWrapper
        self.databaseManager = try DatabaseManagerImpl()
    }

    func fetchBible() async throws -> Bible {
        try await databaseManager.fetchObject(DBTestament.self, wrapper: bibleWrapper)        
    }
    
    func fetchBooks(booksIDs: [Int]) async throws -> [Book] {
        try await databaseManager.fetchObjects(
            ofType: DBBook.self,
            property: "id",
            in: booksIDs,
            wrapper: bookWrapper)
    }
    
}
