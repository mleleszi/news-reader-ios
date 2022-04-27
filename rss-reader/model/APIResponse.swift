//
//  APIResponse.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import Foundation

struct APIResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
