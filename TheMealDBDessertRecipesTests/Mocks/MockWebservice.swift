//
//  MockWebservice.swift
//  TheMealDBDessertRecipesTests
//
//  Created by Fatima Jamil on 6/16/23.
//

import Foundation
@testable import TheMealDBDessertRecipes


class MockWebservice: Webservice {
    var response: Data?
    var error: Error?
    
    override func get<T: Decodable>(url: URL, parse: @escaping (Data) throws -> T?) async throws -> T {
        if let error = error {
            throw error
        }
        
        let responseData = response ?? Data()

        guard let parsedData = try parse(responseData) else {
            throw NetworkError.decodingError
        }
    
        
        return parsedData
    }

}
