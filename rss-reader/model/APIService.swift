//
//  APIService.swift
//  rss-reader
//
//  Created by Marcell Leleszi on 2022. 04. 26..
//

import Foundation

struct APIService: APIServiceProtocol {
    func fetchArticles(url: URL?, completion: @escaping (Result<[Article], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200 ... 299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let res = try decoder.decode(APIResponse.self, from: data)
                    completion(Result.success(res.articles))
                } catch {
                    print(error)
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
}
