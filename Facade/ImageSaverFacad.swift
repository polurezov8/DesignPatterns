//
//  ImageSaverFacad.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/3/19.
//

import UIKit

class ImageSaverFacad {
    // MARK: - Private properties
    private let pathProvider = PathProvider()
    private let dataProvider = ImageDataProvider()

    // MARK: - Public methods
    public func save(image: UIImage, type: ImageType, fileName: String, overwrite: Bool) throws {
        let destinationURL = try pathProvider.createDestinationPath(fileName: fileName)
        let imageData = try dataProvider.data(from image: image, type: type)
        let writeOptions: Data.WritingOptions = overwrite ? .atomic : .withoutOverwriting
        try imageData.write(to: destinationURL, options: writeOptions)
    }
}
