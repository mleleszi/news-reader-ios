//
//  ArticleFetcher.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articles = [Article]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var nextIndex = 2
        
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllArticles(page: 1, searchFor: "apple")
    }
    
    func fetchMoreArticles(searchFor keyword: String) {
        fetchAllArticles(page: nextIndex, searchFor: keyword)
        nextIndex += 1
    }
    
    func fetchAllArticles(page: Int, searchFor keyword: String) {
        isLoading = true
        errorMessage = nil
                
        let url = URL(string: "https://newsapi.org/v2/everything?q=\(keyword)&from=2022-04-26&sortBy=popularity&apiKey=920fb93b595c44e08bd285f4edbcd8a2&pageSize=20&page=\(page)")
        
        service.fetchArticles(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let articles):
                    self.articles.append(contentsOf: articles)
                }
            }
        }
    }
}
