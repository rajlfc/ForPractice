//
//  ViewController.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 20/12/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var movieTableView: UITableView!
    var posterImageData = [String]()
    var movieTitle = [String]()
    var outputResults = [Results]()
    var movieIds = [Int32]()
    var numberOfRows = 0
    let movieManager = MovieDataManager()
    let favouriteManager = FavouriteListDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieTableView.register(UINib(nibName: "MoviesTableViewCell",bundle: nil), forCellReuseIdentifier: "MoviesTableViewCell")
        fetchData()
        movieTableView.dataSource = self
        movieTableView.delegate = self
    }

    func fetchData() {
        let movieResult = movieManager.getAllMovies()
        print("Documents Directory: ", FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).last ?? "Not Found!")
        HttpUtility.shared.fetchApiData { results, numberOfResults in
            self.numberOfRows = numberOfResults
            self.outputResults = results
            for i in 0..<self.numberOfRows {
                self.posterImageData.append(results[i].poster_path)
                self.movieTitle.append(results[i].title)
                self.movieIds.append(Int32(results[i].id))
                if movieResult.count != numberOfResults {
                    let favList = FavouritedList(isFavourited: false)
                    self.movieManager.create(record: MovieList(movieId: self.movieIds[i],favouritedList: favList))
                    
               }
                
            }
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var isFavourite = false
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        cell.delegate = self
        let resultImage = "https://www.themoviedb.org/t/p/original" + posterImageData[indexPath.row]
        let movieResult = movieManager.getAllMovies()
        let favResult = favouriteManager.getAllFavourites()
        if movieResult.count != 0 {
            let favList = favouriteManager.getAllFavourites()
            let favValue = favList?[indexPath.row].isFavourited
            isFavourite = favValue!
        }
        cell.setUpUI(movieTitle: movieTitle[indexPath.row], movieImage: resultImage, isFavourite: isFavourite)
        return cell
    }
}

extension ViewController: clickOnFavouriteAction {
    
    
    /// click action on start icon
    /// - Parameter cell: MoviesTableViewCell
    func clickAndMakeFavourite(cell: MoviesTableViewCell) {
        if let indexPath = movieTableView.indexPath(for: cell) {
            let favResult = favouriteManager.getAllFavourites()
            let favOutput = favResult?[indexPath.row].isFavourited!
            if favOutput == true {
                movieManager.updateMovie(record: MovieList(movieId: movieIds[indexPath.row], favouritedList: FavouritedList(isFavourited: false)))
                cell.favouriteButton.setImage(UIImage(named: "NotFavouritedImage"), for: .normal)
            } else {
                movieManager.updateMovie(record: MovieList(movieId: movieIds[indexPath.row], favouritedList: FavouritedList(isFavourited: true)))
                cell.favouriteButton.setImage(UIImage(named: "FavouritedImage"), for: .normal)
            }
        }
    }
}

