//
//  APIService.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import Foundation

protocol APIServiceProtocol {
    func fetchArticles(url: URL?, completion: @escaping(Result<[Article], APIError>) -> Void)
}
