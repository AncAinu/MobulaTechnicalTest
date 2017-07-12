//
//  MovieViewViewModel.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 12/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import Foundation

protocol MovieViewViewModel {
	var title: Dynamic<String> { get }
}

class MovieViewViewModelFromMovie: MovieViewViewModel {
	private(set) var movie: Movie
	
	var title: Dynamic<String>
	
	init(movie: Movie) {
		self.movie = movie
		
		self.title = Dynamic<String>(movie.title)
	}
}
