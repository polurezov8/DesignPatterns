//
//  StrategyBaseExample.swift
//  Strategy
//
//  Created by Dmitriy Polurezov on 16.06.2020.
//

import UIKit

public protocol MovieRatingStrategy {
    var ratingServiceName: String { get }
    func fetchRating(for movieTitle: String, success: (_ rating: String, _ review: String) -> Void)
}

class RottenTomatoesClient: MovieRatingStrategy {

    public let ratingServiceName = "Rotten Tomatoes"

    public func fetchRating(for movieTitle: String, success: (_ rating: String, _ review: String) -> ()) {
        // In a real service, you’d make a network request...
        // Here, we just provide dummy values...
        let rating = "95%"
        let review = "It rocked!"
        success(rating, review)
    }
}

class IMDbClient: MovieRatingStrategy {

    public let ratingServiceName = "IMDb"

    public func fetchRating(for movieTitle: String, success: (_ rating: String, _ review: String) -> ()) {
        let rating = "3 / 10"
        let review = """
        It was terrible! The audience was throwing rotten
        tomatoes!
        """

        success(rating, review)
    }
}

public class MovieRatingViewController: UIViewController {

    // MARK: - Properties
    public var movieRatingClient: MovieRatingStrategy!

    // MARK: - Fake Outlets
    @IBOutlet public var movieTitleTextField: UITextField!
    @IBOutlet public var ratingServiceNameLabel: UILabel!
    @IBOutlet public var ratingLabel: UILabel!
    @IBOutlet public var reviewLabel: UILabel!

    // MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        ratingServiceNameLabel.text = movieRatingClient.ratingServiceName
    }

    // MARK: - Actions
    @IBAction public func searchButtonPressed(sender: Any) {
        guard let movieTitle = movieTitleTextField.text else {
            return
        }

        movieRatingClient.fetchRating(for: movieTitle) { [weak self] rating, review in
            self?.ratingLabel.text = rating
            self?.reviewLabel.text = review
        }
    }
}
