//
//  MockDataLoader.swift
//  TheMealDBDessertRecipesTests
//
//  Created by Fatima Jamil on 6/16/23.
//

import Foundation
import XCTest

struct MockDataLoader {
    static func loadMockData(fromFile fileName: String, inBundle bundle: Bundle = Bundle.main) throws -> Data {
        guard let filePath = bundle.path(forResource: fileName, ofType: "json") else {
            throw NSError(domain: "TestError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to locate JSON file"])
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            return data
        } catch {
            throw NSError(domain: "TestError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load JSON data: \(error)"])
        }
    }
}
