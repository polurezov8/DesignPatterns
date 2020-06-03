//
//  MediatorRealWorld.swift
//  Mediator
//
//  Created by Dmitriy Polurezov on 03.06.2020.
//

import XCTest

struct News: Equatable {

    let id: Int
    let title: String
    var likesCount: Int

    static func == (left: News, right: News) -> Bool {
        return left.id == right.id
    }
}

protocol ScreenUpdatable: class {
    func likeAdded(to news: News)
    func likeRemoved(from news: News)
}

class NewsFeedViewController: ScreenUpdatable {

    private var newsArray: [News]
    private weak var mediator: ScreenUpdatable?

    init(_ mediator: ScreenUpdatable?, _ newsArray: [News]) {
        self.newsArray = newsArray
        self.mediator = mediator
    }

    func likeAdded(to news: News) {
        debugPrint("News Feed: Received a liked news model with id \(news.id)")
        for var item in newsArray where item == news {
            item.likesCount += 1
        }
    }

    func likeRemoved(from news: News) {
        debugPrint("News Feed: Received a disliked news model with id \(news.id)")
        for var item in newsArray where item == news {
            item.likesCount -= 1
        }
    }

    func userLikedAllNews() {
        debugPrint("\n\nNews Feed: User LIKED all news models")
        debugPrint("News Feed: I am telling to mediator about it...\n")
        newsArray.forEach { mediator?.likeAdded(to: $0) }
    }

    func userDislikedAllNews() {
        debugPrint("\n\nNews Feed: User DISLIKED all news models")
        debugPrint("News Feed: I am telling to mediator about it...\n")
        newsArray.forEach { mediator?.likeRemoved(from: $0) }
    }
}

class NewsDetailViewController: ScreenUpdatable {

    private var news: News
    private weak var mediator: ScreenUpdatable?

    init(_ mediator: ScreenUpdatable?, _ news: News) {
        self.news = news
        self.mediator = mediator
    }

    func likeAdded(to news: News) {
        debugPrint("News Detail: Received a liked news model with id \(news.id)")
        if self.news == news {
            self.news.likesCount += 1
        }
    }

    func likeRemoved(from news: News) {
        debugPrint("News Detail: Received a disliked news model with id \(news.id)")
        if self.news == news {
            self.news.likesCount -= 1
        }
    }
}

class ProfileViewController: ScreenUpdatable {

    private var numberOfGivenLikes: Int
    private weak var mediator: ScreenUpdatable?

    init(_ mediator: ScreenUpdatable?, _ numberOfGivenLikes: Int) {
        self.numberOfGivenLikes = numberOfGivenLikes
        self.mediator = mediator
    }

    func likeAdded(to news: News) {
        debugPrint("Profile: Received a liked news model with id \(news.id)")
        numberOfGivenLikes += 1
    }

    func likeRemoved(from news: News) {
        debugPrint("Profile: Received a disliked news model with id \(news.id)")
        numberOfGivenLikes -= 1
    }
}

class ScreenMediator: ScreenUpdatable {

    private var screens: [ScreenUpdatable]?

    func update(_ screens: [ScreenUpdatable]) {
        self.screens = screens
    }

    func likeAdded(to news: News) {
        debugPrint("Screen Mediator: Received a liked news model with id \(news.id)")
        screens?.forEach { $0.likeAdded(to: news) }
    }

    func likeRemoved(from news: News) {
        debugPrint("ScreenMediator: Received a disliked news model with id \(news.id)")
        screens?.forEach { $0.likeRemoved(from: news) }
    }
}

class MediatorRealWorld: XCTestCase {

    func test() {
        let newsArray = [News(id: 1, title: "News1", likesCount: 1),
                         News(id: 2, title: "News2", likesCount: 2)]

        let numberOfGivenLikes = newsArray.reduce(0, { $0 + $1.likesCount })

        let mediator = ScreenMediator()

        let feedVC = NewsFeedViewController(mediator, newsArray)
        let newsDetailVC = NewsDetailViewController(mediator, newsArray.first!)
        let profileVC = ProfileViewController(mediator, numberOfGivenLikes)

        mediator.update([feedVC, newsDetailVC, profileVC])

        feedVC.userLikedAllNews()
        feedVC.userDislikedAllNews()
    }
}
