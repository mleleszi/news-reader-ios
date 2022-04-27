//
//  ErrorView.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var articleViewModel: ArticleViewModel

    var body: some View {
        VStack {
            Text(articleViewModel.errorMessage ?? "Something went wrong")

            Button {
                articleViewModel.fetchAllArticles(page: 1, searchFor: "apple")
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(articleViewModel: ArticleViewModel())
    }
}
