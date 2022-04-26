//
//  ArticleListItemView.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import SwiftUI

struct ArticleListItemView: View {
    let article: Article
    let imageSize: CGFloat = 100
    

    var body: some View {
        HStack {
            if article.urlToImage != nil {
                AsyncImage(url: URL(string: article.urlToImage!)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()

                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(article.title ?? "No title")
                    .font(.headline)
                 // Text(article.publishedAt, style: .date)
                Text(article.source.name)
            }
        }
    }
}

struct ArticleListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListItemView(article: Article.returnExampleArticle())
    }
}
