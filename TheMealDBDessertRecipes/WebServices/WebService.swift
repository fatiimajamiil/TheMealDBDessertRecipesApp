//
//  WebService.swift
//  TheMealDBDessertRecipes
//
//  Created by Fatima Jamil on 6/15/23.
//
import Foundation

// get dessert list

// get dessert details

// using one function to get the data
// provide ability to parse data

// This class encapsulates network-related functionality. The get method performs an asynchronous network request using URLSession to fetch data from a specified URL. It also takes a parse closure that is responsible for parsing the received data into a specified type. If the request is successful and the parsing is successful, the method returns the parsed result; otherwise, it throws an appropriate error.
// handles network requests and data parsing

class Webservice {
    // get method performs an asynchronous network request to fetch data from the provided URL
    // try await -- operation is awaited, meaning code excution will pause until the response is received
    func get<T: Decodable>(url: URL, parse: @escaping (Data) throws -> T?) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw NetworkError.badRequest
        }
        
        guard let result = try parse(data) else {
            throw NetworkError.decodingError
        }
        
        return result
    }

    enum NetworkError: Error {
        //case invalidURL
        case badRequest
        case decodingError
    }

}
