//
//  FileUtil.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

import Foundation

protocol FileUtil {
    func databasePath() throws -> URL
}

struct FileUtilImpl: FileUtil {

    private let databaseName = "database.realm"

    func databasePath() throws -> URL {
        let bundle = try self.bundle()
        let bundlePath = bundle.bundlePath
        let path = bundlePath + "/" + databaseName
        return URL(filePath: path)
    }

    private func bundle() throws -> Bundle {
        let bundlePath = Bundle.module.bundlePath
        guard let bundle = Bundle(path: bundlePath) else {
            throw BSError.unableToFindDatabaseFile
        }

        return bundle
    }

}
