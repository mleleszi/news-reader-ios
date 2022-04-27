//
//  ContentView.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import SwiftUI

struct ContentView: View {
    @StateObject var articleViewModel = ArticleViewModel()

    var body: some View {
        VStack {
            if articleViewModel.isLoading {
                LoadingView()
            } else if articleViewModel.errorMessage != nil {
                ErrorView(articleViewModel: articleViewModel)
            } else {
                ArticleListView(articles: articleViewModel.articles)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
