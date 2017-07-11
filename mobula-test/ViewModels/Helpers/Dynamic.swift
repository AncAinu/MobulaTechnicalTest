//
//  Dynamic.swift
//  mobula-test
//
//  Created by Tancrède Chazallet on 11/07/2017.
//  Copyright © 2017 Tancrède Chazallet. All rights reserved.
//

import Foundation

class Dynamic<T> {
	typealias Listener = (T) -> Void
	var listener: Listener?
	
	func bind(listener: Listener?) {
		self.listener = listener
	}
	
	func bindAndFire(listener: Listener?) {
		self.listener = listener
		listener?(value)
	}
	
	var value: T {
		didSet {
			listener?(value)
		}
	}
	
	init(_ v: T) {
		value = v
	}
}
