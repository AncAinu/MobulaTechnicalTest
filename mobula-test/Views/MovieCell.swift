//
//  MovieCell.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 12/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
	
	static let identifier = "MovieCell"
	
	let movieThumbnailImageView = UIImageView()
	let titleLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		contentView.backgroundColor = .gray
		
		movieThumbnailImageView.contentMode = .scaleAspectFill
		movieThumbnailImageView.clipsToBounds = true
		movieThumbnailImageView.backgroundColor = .lightGray
		contentView.addSubview(movieThumbnailImageView)
		movieThumbnailImageView.keepTopInset.equal = 0
		movieThumbnailImageView.keepHorizontalInsets.equal = 0
		movieThumbnailImageView.keepAspectRatio.equal = 0.75
		
		titleLabel.textColor = .white
		contentView.addSubview(titleLabel)
		titleLabel.keepHorizontalInsets.equal = 10
		titleLabel.keepBottomInset.equal = 10
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
