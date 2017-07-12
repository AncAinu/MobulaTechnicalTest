//
//  MovieViewViewModel.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 12/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import UIKit

protocol MovieViewViewModel {
	var backgroundColor: Dynamic<UIColor> { get }
	var movieThumbnailCornerRadius: Dynamic<CGFloat> { get }
	
	var title: Dynamic<String> { get }
	var thumbnailURL: Dynamic<URL?> { get }
}

class MovieViewViewModelFromLayoutAndMovie: MovieViewViewModel {
	private let layout: Layout
	private(set) var movie: Movie
	
	var title: Dynamic<String>
	var thumbnailURL: Dynamic<URL?>
	// Layout
	var backgroundColor: Dynamic<UIColor>
	var movieThumbnailCornerRadius: Dynamic<CGFloat>
	
	init(layout: Layout, movie: Movie) {
		self.movie = movie
		self.layout = layout
		
		self.title = Dynamic<String>(movie.title)
		self.thumbnailURL = Dynamic<URL?>(movie.thumbnailUrl)
		
		self.backgroundColor = Dynamic(layout.viewControllerBackgroundColor)
		self.movieThumbnailCornerRadius = Dynamic(CGFloat(layout.movieThumbnailCornerRadius))
	}
}
