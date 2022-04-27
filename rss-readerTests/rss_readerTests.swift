//
//  rss_readerTests.swift
//  rss-readerTests
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import XCTest
import Combine
@testable import rss_reader

class rss_readerTests: XCTestCase {
    
    var subscriptions = Set<AnyCancellable>()

    func test_fetching_articles_success() {
        // GIVEN
        let result = Result<[Article], APIError>.success([Article.returnExampleArticle(), Article.returnExampleArticle()])
        let fetcher = ArticleFetcher(service: MockAPIService(result: result))
        let promise = expectation(description: "fetch data")
        
        // WHEN
        fetcher.$articles.sink { articles in
            if articles.count == 2 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        // THEN
        wait(for: [promise], timeout: 2)
    }
    
    func test_fetching_articles_error() {
        // GIVEN
        let result = Result<[Article], APIError>.failure(APIError.badURL)
        let fetcher = ArticleFetcher(service: MockAPIService(result: result))
        let promise = expectation(description: "show error message")
        
        // WHEN
        fetcher.$articles.sink { articles in
            if !articles.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        fetcher.$errorMessage.sink { errorMessage in
            if errorMessage != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        // THEN
        wait(for: [promise], timeout: 2)
    }
            
}
