//
//  ContentView.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import SwiftUI

struct ContentView: View {
    @StateObject var articleFetcher = ArticleFetcher()

    var body: some View {
        VStack {
            if articleFetcher.isLoading {
                LoadingView()
            } else if articleFetcher.errorMessage != nil {
                ErrorView(articleFetcher: articleFetcher)
            } else {
                ArticleListView(articles: articleFetcher.articles)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
