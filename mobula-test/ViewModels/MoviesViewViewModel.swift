//
//  MoviesViewModel.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 11/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import Foundation

struct Item {
	var title: String
}

protocol MoviesViewViewModel {
	var items: Dynamic<[Item]> { get }
}

class MoviesViewModelFromMovies: MoviesViewViewModel {
	let movies: [Movie]
	
	var items: Dynamic<[Item]>
	
	init(movies: [Movie]) {
		self.movies = movies
		
		self.items = Dynamic( movies.map({Item(title: $0.title)}) )
	}
}
