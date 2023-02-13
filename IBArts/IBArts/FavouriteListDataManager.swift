//
//  FavouriteListDataManager.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 21/12/22.
//

import Foundation

struct FavouriteListDataManager {
    
    func create(record: FavouritedList)
    {
        let cdFavourite = FavouriteList(context: PersistentStorage.shared.context)
        cdFavourite.makeFavourite = record.isFavourited!

        PersistentStorage.shared.saveContext()
    }

    func getAllFavourites() -> [FavouritedList]?
    {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: FavouriteList.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [FavouritedList] = []
        records!.forEach({ (cdFavourite) in
            results.append(cdFavourite.convertToFavourites())
        })

        return results
    }

}
