//
//  MoviesViewController.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 10/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
	var viewModel: MoviesViewViewModel {
		didSet {
			viewModel.items.bindAndFire { [unowned self] _ in
				self.tableView.reloadData()
			}
		}
	}
	
	let tableView = UITableView(frame: UIScreen.main.bounds)
	
	// MARK: INIT
	init() {
		viewModel = MoviesViewModelFromMovies(movies: [Movie(title: "test")])
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: LAYOUT
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		
		tableView.delegate = self
		tableView.dataSource = self
		view.addSubview(tableView)
	}
}

// MARK: TABLE
extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.items.value.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = viewModel.items.value[indexPath.row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
		cell.textLabel?.text = item.title
		
		return cell
	}
}
