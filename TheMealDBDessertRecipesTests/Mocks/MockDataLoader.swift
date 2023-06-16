//
//  MockDataLoader.swift
//  TheMealDBDessertRecipesTests
//
//  Created by Fatima Jamil on 6/16/23.
//

import Foundation
import XCTest

/// A utility struct for loading mock data during testing to simulate network responses
struct MockDataLoader {
    /// Loads mock data from a JSON file in the specified bundle
    /// - Parameters:
    ///   - fileName: The name of the JSON file (without the file extension).
    ///   - bundle: The bundle containing the JSON file. The main bundle is used by default.
    /// - Returns: The loaded mock data as `Data`.
    /// - Throws: An error if the JSON file cannot be located or if there is an error while loading the data.
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
