//
//  PathProvider.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/3/19.
//

import Foundation

class PathProvider {
    func createDestinationPath(fileName: String) throws -> URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw ImageSaverError.couldNotCreateDestinationPath
        }

        let destinationPath = path.appendingPathComponent("\(fileName)")
        debugPrint("Destination path is \(destinationPath)")
        return destinationPath
    }
}
