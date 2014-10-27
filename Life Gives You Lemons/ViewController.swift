//
//  ViewController.swift
//  Life Gives You Lemons
//
//  Created by Scott Brady on 10/27/14.
//  Copyright (c) 2014 Spider Monkey Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// view containers
	var firstContainer: UIView!
	var secondContainer: UIView!
	var thirdContainer: UIView!
	var fourthContainer: UIView!

	// margins and fractions
	var kMarginForView = 10
	var kFourth = CGFloat(1.0/4.0)

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: view container function
	func setupContainerViews() {
		self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + self.kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (self.kMarginForView * 2), height: self.view.bounds.height * self.kFourth))

	}


}

