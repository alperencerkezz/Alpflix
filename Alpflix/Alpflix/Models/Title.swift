//
//  Movie.swift
//  Alpflix
//
//  Created by Alperen Çerkez on 3.03.2025.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}

/*
 adult = 0;
 "backdrop_path" = "/sc1abgWNXc29wSBaerrjGBih06l.jpg";
 "genre_ids" =             (
     27,
     878,
     53
 );
 id = 1084199;
 "media_type" = movie;
 "original_language" = en;
 "original_title" = Companion;
 overview = "During a weekend getaway at a secluded lakeside estate, a group of friends finds themselves entangled in a web of secrets, deception, and advanced technology. As tensions rise and loyalties are tested, they uncover unsettling truths about themselves and the world around them.";
 popularity = "1132.399";
 "poster_path" = "/oCoTgC3UyWGfyQ9thE10ulWR7bn.jpg";
 "release_date" = "2025-01-22";
 title = Companion;
 video = 0;
 "vote_average" = "7.1";
 "vote_count" = 588;
 */
