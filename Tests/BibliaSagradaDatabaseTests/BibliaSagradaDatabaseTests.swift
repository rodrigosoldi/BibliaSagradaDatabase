import Testing
@testable import BibliaSagradaDatabase

@Test func fetchBible() async throws {
    print("START TEST")
    Task {
        do  {
            print("START TEST 2")
            let controller: BibliaSagradaControllable = try BibliaSagradaController()
            print("START TEST 3")
            let bible = try await controller.fetchBible()
            print("START TEST = 4")
            #expect(bible.newTestament.books.count == 27)
            #expect(bible.oldTestament.books.count == 0)
        } catch {
            print(error)
            #expect(false)
        }
    }
}
