//
//  MovieDatabase+CoreDataProperties.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 21/12/22.
//
//

import Foundation
import CoreData


extension MovieDatabase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieDatabase> {
        return NSFetchRequest<MovieDatabase>(entityName: "MovieDatabase")
    }

    @NSManaged public var movieId: Int32
    @NSManaged public var toFavouriteList: FavouriteList?

}

extension MovieDatabase : Identifiable {

}
