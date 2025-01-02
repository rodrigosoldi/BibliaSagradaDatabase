// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import RealmSwift

protocol BibliaSagradaControllable {
    func fetchBible() async throws -> Bible
}

final class BibliaSagradaController: BibliaSagradaControllable, @unchecked Sendable {
    
    private let fileUtil: FileUtil
    private let queue: DispatchQueue = DispatchQueue(label: "com.soldi.BibliaSagradaDatabase.queue")
    private var realm: Realm!

    public convenience init() throws {
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
    
    public func fetchBible() async throws -> Bible {        
        fatalError()
    }
    
}
