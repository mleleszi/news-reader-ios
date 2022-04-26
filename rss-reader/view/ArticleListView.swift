//
//  ArticleListView.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import SwiftUI

struct ArticleListView: View {
    let articles: [Article]
    
    @State private var searchText: String = ""
    
    var filteredArticles: [Article] {
        if searchText.count == 0 {
            return articles
        } else  {
            return articles.filter { $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        // TODO: make it refreshable
        NavigationView {
            List {
                ForEach(filteredArticles) { article in
                    NavigationLink {
                        ArticleContentView(article: article)
                    } label: {
                        ArticleListItemView(article: article)
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
        ArticleListView(articles: [Article.returnExampleArticle(), Article.returnExampleArticle()])
    }
}
 
