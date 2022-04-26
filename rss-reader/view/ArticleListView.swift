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
        // TODO: make it refreshable
        NavigationView {
            List {
                ForEach(articles) { article in
                    NavigationLink {
                        ArticleContentView(article: article)
                    } label: {
                        ArticleListItemView(article: article)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Articles")
        }
         
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articles: [Article.returnExampleArticle(), Article.returnExampleArticle()])
    }
}
 
