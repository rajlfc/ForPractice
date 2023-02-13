//
//  GetCharacterResponse.swift
//  RickAndMorty
//
//  Created by Sudipta Kumar Bhattacharjee on 07/01/23.
//

import Foundation

struct RmGetAllCharacterResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacter]
}
