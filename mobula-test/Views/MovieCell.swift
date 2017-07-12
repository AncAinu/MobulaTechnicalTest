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
	
	let titleLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		contentView.backgroundColor = .gray
		
		titleLabel.textColor = .white
		contentView.addSubview(titleLabel)
		titleLabel.keepHorizontalInsets.equal = 10
		titleLabel.keepBottomInset.equal = 10
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
