import UIKit

private protocol SharingSupportable {
    /// Abstraction
    func accept(service: SharingService)
    func update(content: Content)
}

protocol Content: CustomStringConvertible {
    var title: String { get }
    var images: [UIImage] { get }
}

protocol SharingService {
    /// Implementation
    func share(content: Content)
}

struct FoodDomainModel: Content {
    var title: String
    var images: [UIImage]
    var calories: Int

    var description: String {
        return "Food Model"
    }
}

class BaseViewController: UIViewController, SharingSupportable {

    fileprivate var shareService: SharingService?

    func update(content: Content) {
        /// ...updating UI and showing a content...
        /// ...
        /// ... then, a user will choose a content and trigger an event
        debugPrint("\(description): User selected a \(content) to share")
        /// ...
        shareService?.share(content: content)
    }

    func accept(service: SharingService) {
        shareService = service
    }
}

class PhotoViewController: BaseViewController {

    /// Custom UI and features
    override var description: String {
        return "PhotoViewController"
    }
}

class FeedViewController: BaseViewController {

    /// Custom UI and features
    override var description: String {
        return "FeedViewController"
    }
}

class FaceBookSharingService: SharingService {

    func share(content: Content) {
        /// Use FaceBook API to share a content
        debugPrint("Service: \(content) was posted to the Facebook")
    }
}

class InstagramSharingService: SharingService {

    func share(content: Content) {
        /// Use Instagram API to share a content
        debugPrint("Service: \(content) was posted to the Instagram", terminator: "\n\n")
    }
}
