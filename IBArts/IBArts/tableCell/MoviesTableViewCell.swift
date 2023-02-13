//
//  MoviesTableViewCell.swift
//  IBArts
//
//  Created by Sudipta Kumar Bhattacharjee on 21/12/22.
//

import UIKit

protocol clickOnFavouriteAction: AnyObject {
    func clickAndMakeFavourite(cell: MoviesTableViewCell)
}

class MoviesTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    weak var delegate: clickOnFavouriteAction?
    
    @IBOutlet weak var favouriteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func setUpUI(movieTitle: String, movieImage: String,isFavourite: Bool) {
        self.movieTitle.text = movieTitle
        let url = URL(string: movieImage)
        let data = try? Data(contentsOf: url!)
        self.moviePoster.image = UIImage(data: data!)
        if isFavourite {
            self.favouriteButton.setImage(UIImage(named: "FavouritedImage"), for: .normal)
        } else {
            self.favouriteButton.setImage(UIImage(named: "NotFavouritedImage"), for: .normal)
        }
    }
    
    @IBAction func pressedOnFavourite(_ sender: Any) {
        self.delegate?.clickAndMakeFavourite(cell: self)
    }
}
