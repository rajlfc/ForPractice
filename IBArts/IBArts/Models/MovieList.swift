//
//  MovieList.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 21/12/22.
//

import Foundation

class MovieList {
    let movieId: Int32?
    let favuourited: FavouritedList?
    
    init(movieId: Int32,favouritedList: FavouritedList? = nil) {
        self.movieId = movieId
        self.favuourited = favouritedList
    }
}
