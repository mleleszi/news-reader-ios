//
//  rss_readerUITests.swift
//  rss-readerUITests
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import XCTest

class rss_readerUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    
}
