//
//  MovieViewController.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 12/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import UIKit
import KeepLayout

class MovieViewController: UIViewController {
	let viewModel: MovieViewViewModel
	
	let movieThumbnailImageView = UIImageView()
	let titleLabel = UILabel()
	
	// MARK: INIT
	init(viewModel: MovieViewViewModel) {
		self.viewModel = viewModel
		
		super.init(nibName: nil, bundle: nil)
		
		viewModel.title.bindAndFire { [unowned self] title in
			self.titleLabel.text = title
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: LAYOUT
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		
		movieThumbnailImageView.backgroundColor = .gray
		view.addSubview(movieThumbnailImageView)
		movieThumbnailImageView.keepTopAlignTo(keepLayoutView)?.equal = 10
		movieThumbnailImageView.keepLeftInset.equal = 10
		movieThumbnailImageView.keepWidth.equal = 120
		movieThumbnailImageView.keepAspectRatio.equal = 0.75
		
		titleLabel.textColor = .gray
		titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
		view.addSubview(titleLabel)
		titleLabel.keepLeftOffsetTo(movieThumbnailImageView)?.equal = 10
		titleLabel.keepRightInset.equal = 10
		titleLabel.keepTopAlignTo(movieThumbnailImageView)?.equal = 0
	}
	
}
