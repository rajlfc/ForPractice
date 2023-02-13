//
//  FavouritedListExtension.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 21/12/22.
//

import Foundation

extension FavouriteList {
    
    func convertToFavourites() -> FavouritedList {
        
        return FavouritedList(isFavourited: self.makeFavourite)
    }
}
