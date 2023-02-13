//
//  MovieListExtension.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 21/12/22.
//

import Foundation

extension MovieDatabase {
    
    func convertToMovieList() -> MovieList {
        
        return MovieList(movieId: self.movieId)
    }
}
