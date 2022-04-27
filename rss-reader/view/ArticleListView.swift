//
//  ArticleListView.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import SwiftUI

struct ArticleListView: View {
    var articles: [Article]
    @ObservedObject var articleViewModel: ArticleViewModel
    @State private var searchText: String = "apple"

    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< articles.count, id: \.self) { index in
                    let article = articles[index]
                    NavigationLink {
                        ArticleContentView(article: article)
                    } label: {
                        ArticleListItemView(article: article)
                    }
                    .onAppear {
                        if index == articles.count - 2 {
                            articleViewModel.fetchMoreArticles(searchFor: searchText)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Articles")
            .searchable(text: $searchText)
            .onSubmit (of: .search) {
                articleViewModel.articles.removeAll()
                articleViewModel.fetchAllArticles(page: 1, searchFor: searchText)
            }
        }
    }
}


struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articles: [Article.returnExampleArticle(), Article.returnExampleArticle()], articleViewModel: ArticleViewModel())
    }
}
 
