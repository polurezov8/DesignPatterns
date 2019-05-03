//
//  ImageSaverError.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/3/19.
//

import Foundation

enum ImageSaverError: Error {
    case couldNotCreateDestinationPath
    case couldNotCreateJPEGFromImage
    case couldNotCreatePNGDataFromImage
    case couldNotSaveImageByDestinationPath
}
