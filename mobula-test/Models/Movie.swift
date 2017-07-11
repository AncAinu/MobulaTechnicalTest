//
//  Movie.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 11/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import Foundation

class Movie {
	var title: String
	
	init(info: [String: Any]) {
		self.title = info["title"] as? String ?? ""
	}
}
