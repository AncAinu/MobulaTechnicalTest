//
//  MoviesViewModel.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 11/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import Foundation
import Alamofire

struct Item {
	var title: String
}

protocol MoviesViewViewModel {
	var items: Dynamic<[Item]> { get }
	
	func reloadMovies()
	func movieViewViewModel(index: Int) -> MovieViewViewModel
}

class MoviesViewModelFromMovies: MoviesViewViewModel {
	private(set) var movies = [Movie]() {
		didSet {
			items.value = movies.map({Item(title: $0.title)})
		}
	}
	
	var items = Dynamic<[Item]>([Item]())
	
	init() {
		
	}
	
	func reloadMovies() {
		Alamofire.request("https://static.grabble.com/misc/ios-test/movies.json").responseJSON { [weak self] response in
			if let resultInfo = response.result.value as? [String: Any] {
				if let moviesInfo = resultInfo["results"] as? [[String: Any]] {
					self?.movies = moviesInfo.map {Movie(info: $0)}
				}
			}
		}
	}
	
	func movieViewViewModel(index: Int) -> MovieViewViewModel {
		return MovieViewViewModelFromMovie(movie: movies[index])
	}
}
