//
//  TemplateMethodRealWorld.swift
//  TemplateMethod
//
//  Created by Dmitriy Polurezov on 16.06.2020.
//

import XCTest
import AVFoundation
import CoreLocation
import Photos

protocol PermissionAccessorProtocol: CustomStringConvertible {
    typealias Completion = (Bool) -> Void

    var description: String { get }

    /// Should be implemented
    func requestAccessIfNeeded(_ completion: @escaping Completion)
    func requestAccess(_ completion: @escaping Completion)
    func hasAccess() -> Bool

    /// Hooks
    func willReceiveAccess()
    func didReceiveAcesss()
    func didRejectAcesss()
}

/// Base implementation
extension PermissionAccessorProtocol {
    func requestAccessIfNeeded(_ completion: @escaping Completion) {
        guard !hasAccess() else {
            completion(true)
            return
        }

        willReceiveAccess()

        requestAccess { status in
            status ? self.didReceiveAcesss() : self.didRejectAcesss()
            completion(status)
        }
    }

    /// Hooks
    func willReceiveAccess() {}
    func didReceiveAcesss() {}
    func didRejectAcesss() {}
}

class CameraAccessor: PermissionAccessorProtocol {

    var description: String {
        return "Camera"
    }

    func requestAccess(_ completion: @escaping Completion) {
        AVCaptureDevice.requestAccess(for: .video) { status in
            return completion(status)
        }
    }

    func hasAccess() -> Bool {
        return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    }
}

class MicrophoneAccessor: PermissionAccessorProtocol {

    var description: String {
        return "Microphone"
    }

    func requestAccess(_ completion: @escaping Completion) {
        AVAudioSession.sharedInstance().requestRecordPermission { status in
            completion(status)
        }
    }

    func hasAccess() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission == .granted
    }
}

class PhotoLibraryAccessor: PermissionAccessorProtocol {

    var description: String {
        return "PhotoLibrary"
    }

    func requestAccess(_ completion: @escaping Completion) {
        PHPhotoLibrary.requestAuthorization { status in
            completion(status == .authorized)
        }
    }

    func hasAccess() -> Bool {
        return PHPhotoLibrary.authorizationStatus() == .authorized
    }

    func didReceiveAcesss() {
        /// We want to track how many people give access to the PhotoLibrary.
        debugPrint("PhotoLibrary Accessor: Receive access. Updating analytics...")
    }

    func didRejectAcesss() {
        /// ... and also we want to track how many people rejected access.
        debugPrint("PhotoLibrary Accessor: Rejected with access. Updating analytics...")
    }
}

class TemplateMethodRealWorld: XCTestCase {

    func testTemplateMethodReal() {
        let accessors: [PermissionAccessorProtocol] = [CameraAccessor(), MicrophoneAccessor(), PhotoLibraryAccessor()]
        accessors.forEach { item in
            item.requestAccessIfNeeded { status in
                debugPrint(status ? "You have access to " : "You do not have access to " + item.description + "\n")
            }
        }
    }
}
