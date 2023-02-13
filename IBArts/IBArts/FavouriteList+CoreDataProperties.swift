//
//  FavouriteList+CoreDataProperties.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 21/12/22.
//
//

import Foundation
import CoreData


extension FavouriteList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteList> {
        return NSFetchRequest<FavouriteList>(entityName: "FavouriteList")
    }

    @NSManaged public var makeFavourite: Bool
    @NSManaged public var toMovieDataBase: MovieDatabase?

}

extension FavouriteList : Identifiable {

}
