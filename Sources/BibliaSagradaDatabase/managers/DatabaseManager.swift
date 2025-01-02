//
//  DatabaseManager.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 01/01/25.
//

import Foundation
import RealmSwift

protocol DatabaseManager {
    func fetchObject<T: RealmFetchable, R>(_ type: T.Type, wrapper: any Wrapper<[T], R>) async throws -> R
}

final class DatabaseManagerImpl: DatabaseManager, @unchecked Sendable {
    
    private typealias K = Constants
    private struct Constants {
        static let queueLabel: String = "com.soldi.BibliaSagradaDatabase.queue"
    }
    
    private let fileUtil: FileUtil
    private let queue: DispatchQueue
    private var realm: Realm!
    
    convenience init() throws {
        try self.init(fileUtil: FileUtilImpl())
    }
    
    init(fileUtil: FileUtil, readOnly: Bool = true, queue: DispatchQueue = DispatchQueue(label: K.queueLabel)) throws {
        self.fileUtil = fileUtil
        self.queue = queue
        let fileURL = try fileUtil.databasePath()
        let configuration = Realm.Configuration(
            fileURL: fileURL,
            readOnly: readOnly)
        try queue.sync {
            self.realm = try Realm(
                configuration: configuration,
                queue: queue)
        }
    }
    
    func fetchObject<T, R>(_ type: T.Type, wrapper: any Wrapper<[T], R>) async throws -> R where T : RealmFetchable {
        try await withCheckedThrowingContinuation { continuation in
            queue.async { [weak self] in
                guard let self else {
                    continuation.resume(throwing: BSError.objectDetached)
                    return
                }
                
                let objects = Array(self.realm.objects(type))
                let object: R = wrapper.map(objects)
                continuation.resume(returning: object)
            }
        }
    }
    
}
