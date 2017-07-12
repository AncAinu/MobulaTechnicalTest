//
//  MoviesViewController.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 10/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import UIKit
import KeepLayout

class MoviesViewController: UIViewController {
	let viewModel: MoviesViewViewModel = MoviesViewModelFromMovies()
	
	let collectionView: UICollectionView
	
	// MARK: INIT
	init() {
		let collectionViewLayout = UICollectionViewFlowLayout()
		collectionViewLayout.scrollDirection = .vertical
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
		
		super.init(nibName: nil, bundle: nil)
		
		viewModel.items.bindAndFire { [unowned self] _ in
			self.collectionView.reloadData()
		}
		viewModel.reloadMovies()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: LAYOUT
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		
		collectionView.backgroundColor = .white
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
		view.addSubview(collectionView)
		collectionView.keepTopAlignTo(keepLayoutView)?.equal = 0
		collectionView.keepHorizontalInsets.equal = 0
		collectionView.keepBottomAlignTo(keepLayoutView)?.equal = 0
	}
}

// MARK: TABLE
extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.items.value.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let item = viewModel.items.value[indexPath.row]
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
		cell.titleLabel.text = item.title
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellWidth = (view.bounds.size.width - 30.0) / 2.0
		return CGSize(width: (view.bounds.size.width - 30.0) / 2.0, height: cellWidth * 1.5)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
}
