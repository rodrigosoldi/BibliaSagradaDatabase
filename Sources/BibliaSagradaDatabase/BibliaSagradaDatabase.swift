// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import RealmSwift

public protocol BibliaSagradaControllable {
    func fetchBible() async throws -> Bible
}

public final class BibliaSagradaController: BibliaSagradaControllable, @unchecked Sendable {
    
    private let fileUtil: FileUtil
    private let wrapper: Wrapper
    private let queue: DispatchQueue = DispatchQueue(label: "com.soldi.BibliaSagradaDatabase.queue")
    private var realm: Realm!

    public convenience init() throws {
        try self.init(fileUtil: FileUtilImpl(), wrapper: WrapperImpl())
    }
    
    init(fileUtil: FileUtil, wrapper: Wrapper) throws {
        self.fileUtil = fileUtil
        self.wrapper = wrapper
        let fileURL = try fileUtil.databasePath()
        let configuration = Realm.Configuration(
            fileURL: fileURL,
            readOnly: true)
        try queue.sync {
            print("VAI CRIAR INSTANCIA")
            do {
                self.realm = try Realm(
                    configuration: configuration,
                    queue: queue)
                print("CRIOU INSTANCIA")
            } catch {
                print("DEU ERRO: \(error)")
                throw error
            }
        }
    }
    
    public func fetchBible() async throws -> Bible {        
        try await withCheckedThrowingContinuation { continuation in
            queue.async { [weak self] in
                guard let self else { return }
                let testaments = Array(self.realm.objects(DBTestament.self))
                let dbBible = DBBible(
                    antigoTestamento: testaments[0],
                    novoTestamento: testaments[1])
                let bible = self.wrapper.map(dbBible)
                continuation.resume(returning: bible)
            }
        }
    }
    
}