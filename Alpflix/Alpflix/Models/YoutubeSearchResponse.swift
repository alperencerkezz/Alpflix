//
//  YoutubeSearchResponse.swift
//  Alpflix
//
//  Created by Alperen Çerkez on 8.03.2025.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
