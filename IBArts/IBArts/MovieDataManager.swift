//
//  MovieDataManager.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 21/12/22.
//

import Foundation
import CoreData

struct MovieDataManager {
    
    func create(record: MovieList) {

        let cdMovie = MovieDatabase(context: PersistentStorage.shared.context)
        cdMovie.movieId = record.movieId!

        if(record.favuourited != nil)
        {
            let cdFavourite = FavouriteList(context: PersistentStorage.shared.context)
            let favourited = record.favuourited?.isFavourited
            cdFavourite.makeFavourite = favourited!
            
            cdMovie.toFavouriteList = cdFavourite
        }
        
        PersistentStorage.shared.saveContext()
    }

    func updateMovie(record: MovieList)
    {
        let employee = getMovie(byId: record.movieId!)
        guard employee != nil else {return }
        employee?.movieId = record.movieId!
        let favourited = record.favuourited?.isFavourited
        employee?.toFavouriteList?.makeFavourite = favourited!
        PersistentStorage.shared.saveContext()
    }

    func getAllMovies() -> [MovieList]
    {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: MovieDatabase.self)
        guard records != nil && records?.count != 0 else {return []}

        var results: [MovieList] = []
        records!.forEach({ (cdEmployee) in
            results.append(cdEmployee.convertToMovieList())
        })

        return results
    }

    private func getMovie(byId id: Int32) -> MovieDatabase?
    {
        let fetchRequest = NSFetchRequest<MovieDatabase>(entityName: "MovieDatabase")
        let fetchById = NSPredicate(format: "movieId==%i", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }
    
    func deleteMovie(id: Int32) -> Bool
    {
        let employee = getMovie(byId: id)
        guard employee != nil else {return false}

        PersistentStorage.shared.context.delete(employee!)
        PersistentStorage.shared.saveContext()

        return true
    }
}
