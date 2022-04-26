//
//  ErrorView.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var articleFetcher: ArticleFetcher

    var body: some View {
        VStack {
            Text(articleFetcher.errorMessage ?? "Something went wrong")

            Button {
                articleFetcher.fetchAllArticles()
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(articleFetcher: ArticleFetcher())
    }
}
