//
//  MockWebservice.swift
//  TheMealDBDessertRecipesTests
//
//  Created by Fatima Jamil on 6/16/23.
//

import Foundation
@testable import TheMealDBDessertRecipes

/**
 A mock implementation of the Webservice protocol that provides controlled responses during unit testing
 It allows for simulating network requests and providing mock responses from JSON data
 */
class MockWebservice: Webservice {
    /// The mock response data to be returned by the get() method.
    var response: Data?
    /// The mock error to be thrown by the get() method.
    var error: Error?
    
    /**
     Overrides the get() method from the Webservice protocol to provide a mock implementation
     It simulates a network request and returns the mock response provided or throws the mock error
     
     - Parameters:
        - url: The URL to make the network request
        - parse: A closure that parses the response data into a generic type
     - Returns: The parsed response data as a generic type T
     - Throws: An error if the mock error is set or if there is an issue with decoding the response data
     */
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
