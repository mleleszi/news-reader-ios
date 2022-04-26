//
//  Article.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import Foundation

struct Article: Decodable, Identifiable {
    let id: UUID
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
    
    enum CodingKeys: CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = UUID()
        source = try values.decode(Source.self, forKey: .source)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        url = try values.decode(String.self, forKey: .url)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        
        let dateString = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        publishedAt = ISO8601DateFormatter().date(from: dateString!)!
        
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }
    
    init(source: Source, author: String, title: String, description: String?, url: String, urlToImage: String?, publishedAt: String, content: String?) {
        id = UUID()
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = ISO8601DateFormatter().date(from: publishedAt)!
        self.content = content
    }
    
    static func returnExampleArticle() -> Article {
        return Article(source: Source(id: nil, name: "The Guardian"),
                       author: "Tumaini Carayol",
                       title: "Emma Raducanu searching for fourth coach after split with Torben Beltz",
                       description: "<ul><li>Beltz’s experience had limited effect in five-month stay</li><li>Recent weeks had seen positive uplift for British player</li></ul>Emma Raducanu has split with her coach, Torben Beltz, after working together for only five months. Citing the need to be…",
                       url: "https://amp.theguardian.com/sport/2022/apr/26/emma-raducanu-searching-for-fourth-coach-after-split-with-torben-beltz-tennis",
                       urlToImage: "https://i.guim.co.uk/img/media/10e972f75e0cc0d30bcf191626544df826c6cfef/0_26_4700_2820/master/4700.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctZGVmYXVsdC5wbmc&enable=upscale&s=2882432f878fa8df919a45dd31fbf775",
                       publishedAt: "2022-04-26T07:43:36Z",
                       content: "Emma Raducanu has split with her coach, Torben Beltz, after working together for only five months. Citing the need to begin a new training model, Raducanu will once again be searching for a new coach… [+3231 chars]")
    }

}
