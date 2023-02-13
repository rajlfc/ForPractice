//
//  HttpUtility.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 20/12/22.
//

import Foundation
import UIKit


struct userResponse: Codable {
    let dates: dateObject
    let results: [Results]
    let total_pages: Int
    let total_results: Int
}

struct dateObject: Codable {
    let maximum: String
    let minimum: String
}

struct Results: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    
//    enum codingKeys: String,CodingKey {
//        case adult
//
//    }
//    init(from decoder:Decoder) throws {
//        let container = try decoder.container(keyedBy: codingKeys.self)
//        let adult = try? container.decode(Bool.self, forKey: .adult)
//    }
}





class HttpUtility {
    
    private init() {
        
    }
    
    static let shared = HttpUtility()
    
    func fetchApiData(completion: @escaping ([Results],Int) -> Void) {
        let url = URL(string: "http://api.themoviedb.org/3/movie/now_playing?api_key=34c902e6393dc8d970be5340928602a7&language=en-US&page=1")
        guard let url = url else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(userResponse.self, from: data)
                completion(decodedData.results, decodedData.results.count)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
