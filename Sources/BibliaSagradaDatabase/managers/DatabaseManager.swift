//
//  DatabaseManager.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 01/01/25.
//

import Foundation
import RealmSwift

protocol DatabaseManager {
    func fetchObjects<T: RealmFetchable>(_ type: T.Type) async throws -> [T]
}

final class DatabaseManagerImpl: DatabaseManager, @unchecked Sendable {
    
    private let fileUtil: FileUtil
    
    private let queue: DispatchQueue = DispatchQueue(label: "com.soldi.BibliaSagradaDatabase.queue")
    private var realm: Realm!
    
    convenience init() throws {
        try self.init(fileUtil: FileUtilImpl())
    }
    
    init(fileUtil: FileUtil) throws {
        self.fileUtil = fileUtil
        let fileURL = try fileUtil.databasePath()
        let configuration = Realm.Configuration(
            fileURL: fileURL,
            readOnly: true)
        try queue.sync {
            self.realm = try Realm(
                configuration: configuration,
                queue: queue)
        }
    }
    
    func fetchObjects<T>(_ type: T.Type) async throws -> [T] where T: RealmFetchable {
        try await withCheckedThrowingContinuation { continuation in
            queue.async { [weak self] in
                guard let self else {
                    continuation.resume(throwing: BSError.objectDetached)
                    return
                }
                
                let objects = Array(self.realm.objects(type))
                continuation.resume(returning: objects)
            }
        }
    }
    
}
