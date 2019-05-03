//
//  ImageDataProvider.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/3/19.
//

import UIKit

class ImageDataProvider {
    // MARK: - Public methods
    public func data(from image: UIImage, type: ImageType) throws -> Data {
        switch type {
        case .jpeg(let compressionQuality):
            return try jpegData(from image: image, compressionQuality: compressionQuality)
        case .png:
            return try pngData(from image: image)
        }
    }

    // MARK: - Private methods
    private func jpegData(from image: UIImage, compressionQuality: CGFloat) throws -> Data {
        guard let imageData = image.jpegData(compressionQuality: compressionQuality) else {
            throw ImageSaverError.couldNotCreatePNGDataFromImage
        }

        return imageData
    }

    private func pngData(from image: UIImage) throws -> Data {
        guard let imageData = image.pngData() else {
            throw ImageSaverError.couldNotCreatePNGDataFromImage
        }

        return imageData
    }
}
