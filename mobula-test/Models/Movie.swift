//
//  Movie.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 11/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import Foundation

class Movie {
	var id: Int
	var title: String
	var description: String
	var director: String
	var starring: String?
	var thumbnailUrl: URL?
	var trailerCoverUrl: URL?
	var ticketUrl: URL?
	var trailerYoutubeId: String?
	
	init(info: [String: Any]) {
		self.id = info["id"] as? Int ?? 0
		self.title = info["title"] as? String ?? ""
		self.description = info["description"] as? String ?? ""
		self.director = info["director"] as? String ?? ""
		self.starring = info["starring"] as? String ?? ""
		self.thumbnailUrl = URL(string: info["thumb_url"] as? String ?? "")
		self.trailerCoverUrl = URL(string: info["trailer_cover_url"] as? String ?? "")
		self.ticketUrl = URL(string: info["ticket_url"] as? String ?? "")
		self.trailerYoutubeId = info["trailer_youtube_id"] as? String ?? ""
	}
}
