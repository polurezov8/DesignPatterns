//
//  PanframeRoof.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/2/19.
//

import Foundation

class PanframeRoof: MercedesDecorator {
    required init(decorator: Mercedesable) {
        super.init(decorator: decorator)
    }

    override func getTitle() -> String {
        return super.getTitle() + "Premium equipment with a panframe roof"
    }

    override func getPrice() -> Double {
        return super.getPrice() + 3000
    }
}
