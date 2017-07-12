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
	var thumbnailURL: URL?
}

protocol MoviesViewViewModel {
	var backgroundColor: Dynamic<UIColor> { get }
	var movieThumbnailCornerRadius: Dynamic<CGFloat> { get }
	var items: Dynamic<[Item]> { get }
	
	func reloadMovies()
	func movieViewViewModel(index: Int) -> MovieViewViewModel
}

class MoviesViewModelFromLayout: MoviesViewViewModel {
	private let layout: Layout
	private(set) var movies = [Movie]() {
		didSet {
			items.value = movies.map({Item(title: $0.title,
			                               thumbnailURL: $0.thumbnailUrl)})
		}
	}
	
	var items = Dynamic<[Item]>([Item]())
	// Layout
	var backgroundColor: Dynamic<UIColor>
	var movieThumbnailCornerRadius: Dynamic<CGFloat>
	
	init(layout: Layout) {
		self.layout = layout
		
		backgroundColor = Dynamic(layout.viewControllerBackgroundColor)
		movieThumbnailCornerRadius = Dynamic(CGFloat(layout.movieThumbnailCornerRadius))
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
		return MovieViewViewModelFromLayoutAndMovie(layout: layout, movie: movies[index])
	}
}
