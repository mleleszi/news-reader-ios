//
//  Source.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import Foundation

struct Source: Decodable {
    let id: String?
    let name: String
    
    enum CodingKeys: CodingKey {
        case id, name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
    }
    
    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}
