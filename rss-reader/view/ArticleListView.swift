//
//  ArticleListView.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import SwiftUI

struct ArticleListView: View {
    let articles: [Article]
    @ObservedObject var articleViewModel: ArticleViewModel

    @State private var searchText: String = ""

    var filteredArticles: [Article] {
        if searchText.count == 0 {
            return articles
        } else {
            return articles.filter { $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }

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
                            articleViewModel.fetchMoreArticles()
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Articles")
            .searchable(text: $searchText)
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articles: [Article.returnExampleArticle(), Article.returnExampleArticle()], articleViewModel: ArticleViewModel())
    }
}
