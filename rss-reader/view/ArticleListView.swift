//
//  ArticleListView.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import SwiftUI

struct ArticleListView: View {
    let articles: [Article]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    ArticleListItemView(article: article)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Articles")
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articles: [Article.returnExampleArticle(), Article.returnExampleArticle()])
    }
}
