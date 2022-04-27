//
//  MockAPIService.swift
//  rss-readerTests
//
//  Created by Marcell Leleszi on 2022. 04. 27..
//

import Foundation

struct MockAPIService: APIServiceProtocol {
    
    var result: Result<[Article], APIError>
    
    func fetchArticles(url: URL?, completion: @escaping (Result<[Article], APIError>) -> Void) {
        completion(result)
    }

}
