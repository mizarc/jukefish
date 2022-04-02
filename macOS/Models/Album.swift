//
//  Album.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 1/4/2022.
//

import Foundation
import SwiftUI

struct Album: Identifiable {
    var id: Int
    var name: String
    var artist: String
    var year: Int
    var image: Image
}
