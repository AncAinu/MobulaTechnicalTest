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
	var thumbnailURL: Dynamic<URL?> { get }
}

class MovieViewViewModelFromMovie: MovieViewViewModel {
	private(set) var movie: Movie
	
	var title: Dynamic<String>
	var thumbnailURL: Dynamic<URL?>
	
	init(movie: Movie) {
		self.movie = movie
		
		self.title = Dynamic<String>(movie.title)
		self.thumbnailURL = Dynamic<URL?>(movie.thumbnailUrl)
	}
}
