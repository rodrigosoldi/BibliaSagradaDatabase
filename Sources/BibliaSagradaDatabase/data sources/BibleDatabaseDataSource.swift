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
    private let wrapper: Wrapper
    private let queue: DispatchQueue
    
    convenience init() throws {
        try self.init(
            wrapper: WrapperImpl())
    }
    
    init(wrapper: Wrapper) throws {
        let queue = DispatchQueue(label: "com.soldi.BibliaSagradaDatabase.queue")
        self.queue = queue
        self.wrapper = wrapper
        self.databaseManager = try DatabaseManagerImpl(queue: queue)
    }

    func fetchBible() async throws -> Bible {
        try await withCheckedThrowingContinuation { continuation in
            queue.async { [weak self] in
                guard let self else {
                    continuation.resume(throwing: BSError.objectDetached)
                    return
                }
                
                Task {
                    let testaments = try await databaseManager.fetchObjects(DBTestament.self, queue: queue)
                    
                    guard testaments.count == 2 else {
                        throw BSError.unableToFetchBible
                    }
                    
                    let dbBible = DBBible(
                        oldTestament: testaments[0],
                        newTestament: testaments[1])
                    let bible = wrapper.map(dbBible)
                    continuation.resume(returning: bible)
                }
            }
        }
    }
    
}
