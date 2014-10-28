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
	var statsContainer: UIView!
	var purchaseContainer: UIView!
	var mixContainer: UIView!
	var startDayContainer: UIView!

	// Labels
	var youHaveLabel: UILabel!
	var youHaveMoneyLabel: UILabel!
	var youHaveLemonsLabel: UILabel!
	var youHaveIceCubesLabel: UILabel!
	var step1Label: UILabel!
	var step2Label: UILabel!
	var step3Label: UILabel!
	var step2Instructions: UILabel!
	var step3Instructions: UILabel!
	var purchaseLemonsLabel: UILabel!
	var purchaseIceCubesLabel: UILabel!
	var numberOfLemonsToPurchaseLabel: UILabel!
	var numberOfIceCubesToPurchaseLabel: UILabel!
	var mixLemonsLabel: UILabel!
	var mixIceCubesLabel: UILabel!
	var numberOfLemonsToMixLabel: UILabel!
	var numberOfIceCubesToMixLabel: UILabel!

	// Buttons
	var addLemonsToPurchaseButton: UIButton!
	var removeLemonsFromPurchaseButton: UIButton!
	var addIceCubesToPurchaseButton: UIButton!
	var removeIceCubesFromPurchaseButton: UIButton!
	var addLemonsToMixButton: UIButton!
	var removeLemonsFromMixButton: UIButton!
	var addIceCubesToMixButton: UIButton!
	var removeIceCubesFromMixButton: UIButton!
	var startDayButton: UIButton!


	// margins and fractions
	let kMarginForView:CGFloat = 10.0
	let kButtonHorizontalPadding:CGFloat = 20.0
	let kStatusBarMargin:CGFloat = 30.0
	let kHalf:CGFloat = 1.0/2.0
	let kThird:CGFloat = 1.0/3.0
	let kFourth:CGFloat = 1.0/4.0
	let kSixth:CGFloat = 1.0/6.0
//	let kEighth:CGFloat = 1.0/8.0
	let kTwelfth:CGFloat = 1.0/12.0
	let kTwentyFourth:CGFloat = 1.0/24.0

	// stats properties
	var currentMoney = 10
	var currentLemons = 1
	var currentIceCubes = 1
	var lemonsToBePurchased = 0
	var iceCubesToBePurchased = 0
	var lemonsToBeMixed = 0
	var iceCubesToBeMixed = 0

	// Costs / Revenues
	let kLemonCost = 2
	let kIceCubeCost = 1

	// Fonts
	let labelFont = UIFont(name: "Menlo-Bold", size:18)
	let instructionsFont = UIFont(name: "Baskerville", size:17)

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setupContainerViews()
		setupStatsContainer(self.statsContainer)
		setupPurchaseContainer(self.purchaseContainer)
		setupMixContainer(self.mixContainer)
		setupStartDayContainer(self.startDayContainer)

/* TODO: Remove
[Marion, Copperplate, Heiti SC, Iowan Old Style, Courier New, Apple SD Gothic Neo, Heiti TC, Gill Sans, Marker Felt, Thonburi, Avenir Next Condensed, Tamil Sangam MN, Helvetica Neue, Gurmukhi MN, Times New Roman, Georgia, Apple Color Emoji, Arial Rounded MT Bold, Kailasa, Kohinoor Devanagari, Sinhala Sangam MN, Chalkboard SE, Superclarendon, Gujarati Sangam MN, Damascus, Noteworthy, Geeza Pro, Avenir, Academy Engraved LET, Mishafi, Futura, Farah, Kannada Sangam MN, Arial Hebrew, Arial, Party LET, Chalkduster, Hiragino Kaku Gothic ProN, Hoefler Text, Optima, Palatino, Malayalam Sangam MN, Lao Sangam MN, Al Nile, Bradley Hand, Hiragino Mincho ProN, Trebuchet MS, Helvetica, Courier, Cochin, Devanagari Sangam MN, Oriya Sangam MN, Snell Roundhand, Zapf Dingbats, Bodoni 72, Verdana, American Typewriter, Avenir Next, Baskerville, Khmer Sangam MN, Didot, Savoye LET, Bodoni Ornaments, Symbol, Menlo, Bodoni 72 Smallcaps, DIN Alternate, Papyrus, Euphemia UCAS, Telugu Sangam MN, Bangla Sangam MN, Zapfino, Bodoni 72 Oldstyle, DIN Condensed]

		println(UIFont.fontNamesForFamilyName("Baskerville"))
*/
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: button functions
	func addLemonsToPurchaseButtonPressed(button: UIButton) {
		println("add lemon to purchase")
	}

	func removeLemonsFromPurchaseButtonPressed(button: UIButton) {
		println("remove lemon from purchase")
	}

	func addIceCubesToPurchaseButtonPressed(button: UIButton) {
		println("add ice cube to purchase")
	}

	func removeIceCubesFromPurchaseButtonPressed(button: UIButton) {
		println("remove ice cube from purchase")
	}

	func addLemonsToMixButtonPressed(button: UIButton) {
		println("add lemon to Mix")
	}

	func removeLemonsFromMixButtonPressed(button: UIButton) {
		println("remove lemon from Mix")
	}

	func addIceCubesToMixButtonPressed(button: UIButton) {
		println("add ice cube to Mix")
	}

	func removeIceCubesFromMixButtonPressed(button: UIButton) {
		println("remove ice cube from Mix")
	}

	func startDayButtonPressed(button: UIButton) {
		println("starting the day")
	}

	// MARK: view container functions
	func setupContainerViews() {
		self.statsContainer = UIView(frame: CGRect(x: 25.0, y: 25.0, width: 30.0, height: 30.0))

		self.statsContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + self.kMarginForView, y: self.kStatusBarMargin + self.view.bounds.origin.y, width: self.view.bounds.width - (self.kMarginForView * 2), height: (self.view.bounds.height - self.kStatusBarMargin) * self.kFourth))
		self.statsContainer.backgroundColor = UIColor.whiteColor()
		self.view.addSubview(self.statsContainer)

		self.purchaseContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + self.kMarginForView, y: self.statsContainer.frame.height + self.kStatusBarMargin, width: self.view.bounds.width - (self.kMarginForView * 2), height: (self.view.bounds.height - self.kStatusBarMargin) * self.kFourth))
		self.purchaseContainer.backgroundColor = UIColor.whiteColor()
		self.view.addSubview(self.purchaseContainer)

		self.mixContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + self.kMarginForView, y: self.statsContainer.frame.height + self.purchaseContainer.frame.height + self.kStatusBarMargin, width: self.view.bounds.width - (self.kMarginForView * 2), height: (self.view.bounds.height - self.kStatusBarMargin) * self.kFourth))
		self.mixContainer.backgroundColor = UIColor.whiteColor()
		self.view.addSubview(self.mixContainer)

		self.startDayContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + self.kMarginForView, y: self.statsContainer.frame.height + self.purchaseContainer.frame.height + self.mixContainer.frame.height + self.kStatusBarMargin, width: self.view.bounds.width - (self.kMarginForView * 2), height: (self.view.bounds.height - self.kStatusBarMargin) * self.kFourth))
		self.startDayContainer.backgroundColor = UIColor.whiteColor()
		self.view.addSubview(self.startDayContainer)
	}

	func setupStatsContainer(containerView: UIView) {
		self.youHaveLabel = UILabel()
		self.youHaveLabel.text = "You have:"
		self.youHaveLabel.textColor = UIColor.redColor()
		self.youHaveLabel.font = self.labelFont
		self.youHaveLabel.sizeToFit()
		self.youHaveLabel.center = CGPoint(x: containerView.frame.origin.x + (self.youHaveLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.youHaveLabel)

		self.youHaveMoneyLabel = UILabel()
		self.youHaveMoneyLabel.text = "$\(self.currentMoney)"
		self.youHaveMoneyLabel.textColor = UIColor.greenColor()
		self.youHaveMoneyLabel.font = self.labelFont
		self.youHaveMoneyLabel.sizeToFit()
		self.youHaveMoneyLabel.center = CGPoint(x: containerView.frame.origin.x + (containerView.frame.width * self.kHalf) + (self.youHaveMoneyLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.youHaveMoneyLabel)

		self.youHaveLemonsLabel = UILabel()
		if (self.currentLemons != 1) {
			self.youHaveLemonsLabel.text = "\(self.currentLemons) Lemons"
		}
		else {
			self.youHaveLemonsLabel.text = "\(self.currentLemons) Lemon"
		}
		self.youHaveLemonsLabel.textColor = UIColor.blackColor()
		self.youHaveLemonsLabel.font = self.labelFont
		self.youHaveLemonsLabel.sizeToFit()
		self.youHaveLemonsLabel.center = CGPoint(x: containerView.frame.origin.x + (containerView.frame.width * self.kHalf) + (self.youHaveLemonsLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth * 3)
		containerView.addSubview(self.youHaveLemonsLabel)

		self.youHaveIceCubesLabel = UILabel()
		if (self.currentIceCubes != 1) {
			self.youHaveIceCubesLabel.text = "\(self.currentIceCubes) Ice Cubes"
		}
		else {
			self.youHaveIceCubesLabel.text = "\(self.currentIceCubes) Ice Cube"
		}
		self.youHaveIceCubesLabel.textColor = UIColor.blackColor()
		self.youHaveIceCubesLabel.font = self.labelFont
		self.youHaveIceCubesLabel.sizeToFit()
		self.youHaveIceCubesLabel.center = CGPoint(x: containerView.frame.origin.x + (containerView.frame.width * self.kHalf) + (self.youHaveIceCubesLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth * 5)
		containerView.addSubview(self.youHaveIceCubesLabel)
	}

	func setupPurchaseContainer(containerView: UIView) {
		self.step1Label = UILabel()
		self.step1Label.text = "Step 1: Purchase Supplies"
		self.step1Label.textColor = UIColor.blueColor()
		self.step1Label.font = self.labelFont
		self.step1Label.sizeToFit()
		self.step1Label.center = CGPoint(x: containerView.frame.origin.x + (self.step1Label.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.step1Label)

		self.purchaseLemonsLabel = UILabel()
		self.purchaseLemonsLabel.text = "Lemons for $\(self.kLemonCost):"
		self.purchaseLemonsLabel.textColor = UIColor.blackColor()
		self.purchaseLemonsLabel.font = self.labelFont
		self.purchaseLemonsLabel.sizeToFit()
		self.purchaseLemonsLabel.center = CGPoint(x: containerView.center.x - (self.purchaseLemonsLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kHalf)
		self.purchaseLemonsLabel.textAlignment = NSTextAlignment.Right
		containerView.addSubview(self.purchaseLemonsLabel)

		self.removeLemonsFromPurchaseButton = UIButton()
		self.removeLemonsFromPurchaseButton.setTitle("-", forState: UIControlState.Normal)
		self.removeLemonsFromPurchaseButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.removeLemonsFromPurchaseButton.titleLabel?.font = self.labelFont
		self.removeLemonsFromPurchaseButton.sizeToFit()
		self.removeLemonsFromPurchaseButton.sizeThatFits(CGSize(width: self.removeLemonsFromPurchaseButton.frame.width + self.kButtonHorizontalPadding, height: self.purchaseLemonsLabel.frame.height))
		self.removeLemonsFromPurchaseButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth), y: self.purchaseLemonsLabel.center.y)
		self.removeLemonsFromPurchaseButton.addTarget(self, action: "removeLemonsFromPurchaseButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.removeLemonsFromPurchaseButton)

		self.numberOfLemonsToPurchaseLabel = UILabel()
		self.numberOfLemonsToPurchaseLabel.text = "\(self.lemonsToBePurchased)"
		self.numberOfLemonsToPurchaseLabel.textColor = UIColor.blackColor()
		self.numberOfLemonsToPurchaseLabel.font = self.labelFont
		self.numberOfLemonsToPurchaseLabel.sizeToFit()
		self.numberOfLemonsToPurchaseLabel.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kFourth), y: self.purchaseLemonsLabel.center.y)
		containerView.addSubview(self.numberOfLemonsToPurchaseLabel)

		self.addLemonsToPurchaseButton = UIButton()
		self.addLemonsToPurchaseButton.setTitle("+", forState: UIControlState.Normal)
		self.addLemonsToPurchaseButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.addLemonsToPurchaseButton.titleLabel?.font = self.labelFont
		self.addLemonsToPurchaseButton.sizeToFit()
		self.addLemonsToPurchaseButton.sizeThatFits(CGSize(width: self.addLemonsToPurchaseButton.frame.width + self.kButtonHorizontalPadding, height: self.purchaseLemonsLabel.frame.height))
		self.addLemonsToPurchaseButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 5), y: self.purchaseLemonsLabel.center.y)
		self.addLemonsToPurchaseButton.addTarget(self, action: "addLemonsToPurchaseButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.addLemonsToPurchaseButton)

		self.purchaseIceCubesLabel = UILabel()
		self.purchaseIceCubesLabel.text = "Ice cubes for $\(self.kIceCubeCost):"
		self.purchaseIceCubesLabel.textColor = UIColor.blackColor()
		self.purchaseIceCubesLabel.font = self.labelFont
		self.purchaseIceCubesLabel.sizeToFit()
		self.purchaseIceCubesLabel.center = CGPoint(x: containerView.center.x - (self.purchaseIceCubesLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth * 5)
		self.purchaseIceCubesLabel.textAlignment = NSTextAlignment.Right
		containerView.addSubview(self.purchaseIceCubesLabel)

		self.removeIceCubesFromPurchaseButton = UIButton()
		self.removeIceCubesFromPurchaseButton.setTitle("-", forState: UIControlState.Normal)
		self.removeIceCubesFromPurchaseButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.removeIceCubesFromPurchaseButton.titleLabel?.font = self.labelFont
		self.removeIceCubesFromPurchaseButton.sizeToFit()
		self.removeIceCubesFromPurchaseButton.sizeThatFits(CGSize(width: self.removeIceCubesFromPurchaseButton.frame.width + self.kButtonHorizontalPadding, height: self.purchaseIceCubesLabel.frame.height))
		self.removeIceCubesFromPurchaseButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth), y: self.purchaseIceCubesLabel.center.y)
		self.removeIceCubesFromPurchaseButton.addTarget(self, action: "removeIceCubesFromPurchaseButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.removeIceCubesFromPurchaseButton)

		self.numberOfIceCubesToPurchaseLabel = UILabel()
		self.numberOfIceCubesToPurchaseLabel.text = "\(self.iceCubesToBePurchased)"
		self.numberOfIceCubesToPurchaseLabel.textColor = UIColor.blackColor()
		self.numberOfIceCubesToPurchaseLabel.font = self.labelFont
		self.numberOfIceCubesToPurchaseLabel.sizeToFit()
		self.numberOfIceCubesToPurchaseLabel.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 3), y: self.purchaseIceCubesLabel.center.y)
		containerView.addSubview(self.numberOfIceCubesToPurchaseLabel)

		self.addIceCubesToPurchaseButton = UIButton()
		self.addIceCubesToPurchaseButton.setTitle("+", forState: UIControlState.Normal)
		self.addIceCubesToPurchaseButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.addIceCubesToPurchaseButton.titleLabel?.font = self.labelFont
		self.addIceCubesToPurchaseButton.sizeToFit()
		self.addIceCubesToPurchaseButton.sizeThatFits(CGSize(width: self.addIceCubesToPurchaseButton.frame.width + self.kButtonHorizontalPadding, height: self.purchaseIceCubesLabel.frame.height))
		self.addIceCubesToPurchaseButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 5), y: self.purchaseIceCubesLabel.center.y)
		self.addIceCubesToPurchaseButton.addTarget(self, action: "addIceCubesToPurchaseButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.addIceCubesToPurchaseButton)
	}

	func setupMixContainer(containerView: UIView) {
		self.step2Label = UILabel()
		self.step2Label.text = "Step 2: Mix Lemonade"
		self.step2Label.textColor = UIColor.blueColor()
		self.step2Label.font = self.labelFont
		self.step2Label.sizeToFit()
		self.step2Label.center = CGPoint(x: containerView.frame.origin.x + (self.step2Label.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.step2Label)

		self.step2Instructions = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: containerView.frame.width * self.kFourth * 3, height: containerView.frame.height * self.kTwentyFourth * 7))
		self.step2Instructions.text = "Do your customers prefer more lemons or ice cubes today?"
		self.step2Instructions.textColor = UIColor.blackColor()
		self.step2Instructions.font = self.instructionsFont
		self.step2Instructions.numberOfLines = 2
		self.step2Instructions.center = CGPoint(x: containerView.center.x, y: containerView.frame.height * self.kTwentyFourth * 9)
		containerView.addSubview(self.step2Instructions)

		self.mixLemonsLabel = UILabel()
		self.mixLemonsLabel.text = "Lemons:"
		self.mixLemonsLabel.textColor = UIColor.blackColor()
		self.mixLemonsLabel.font = self.labelFont
		self.mixLemonsLabel.sizeToFit()
		self.mixLemonsLabel.center = CGPoint(x: containerView.center.x - (self.mixLemonsLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kTwelfth * 7)
		self.mixLemonsLabel.textAlignment = NSTextAlignment.Right
		containerView.addSubview(self.mixLemonsLabel)

		self.removeLemonsFromMixButton = UIButton()
		self.removeLemonsFromMixButton.setTitle("-", forState: UIControlState.Normal)
		self.removeLemonsFromMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.removeLemonsFromMixButton.titleLabel?.font = self.labelFont
		self.removeLemonsFromMixButton.sizeToFit()
		self.removeLemonsFromMixButton.sizeThatFits(CGSize(width: self.removeLemonsFromMixButton.frame.width + self.kButtonHorizontalPadding, height: self.mixLemonsLabel.frame.height))
		self.removeLemonsFromMixButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth), y: self.mixLemonsLabel.center.y)
		self.removeLemonsFromMixButton.addTarget(self, action: "removeLemonsFromMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.removeLemonsFromMixButton)

		self.numberOfLemonsToMixLabel = UILabel()
		self.numberOfLemonsToMixLabel.text = "\(self.lemonsToBeMixed)"
		self.numberOfLemonsToMixLabel.textColor = UIColor.blackColor()
		self.numberOfLemonsToMixLabel.font = self.labelFont
		self.numberOfLemonsToMixLabel.sizeToFit()
		self.numberOfLemonsToMixLabel.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kFourth), y: self.mixLemonsLabel.center.y)
		containerView.addSubview(self.numberOfLemonsToMixLabel)

		self.addLemonsToMixButton = UIButton()
		self.addLemonsToMixButton.setTitle("+", forState: UIControlState.Normal)
		self.addLemonsToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.addLemonsToMixButton.titleLabel?.font = self.labelFont
		self.addLemonsToMixButton.sizeToFit()
		self.addLemonsToMixButton.sizeThatFits(CGSize(width: self.addLemonsToMixButton.frame.width + self.kButtonHorizontalPadding, height: self.mixLemonsLabel.frame.height))
		self.addLemonsToMixButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 5), y: self.mixLemonsLabel.center.y)
		self.addLemonsToMixButton.addTarget(self, action: "addLemonsToMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.addLemonsToMixButton)

		self.mixIceCubesLabel = UILabel()
		self.mixIceCubesLabel.text = "Ice cubes:"
		self.mixIceCubesLabel.textColor = UIColor.blackColor()
		self.mixIceCubesLabel.font = self.labelFont
		self.mixIceCubesLabel.sizeToFit()
		self.mixIceCubesLabel.center = CGPoint(x: containerView.center.x - (self.mixIceCubesLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth * 5)
		self.mixIceCubesLabel.textAlignment = NSTextAlignment.Right
		containerView.addSubview(self.mixIceCubesLabel)

		self.removeIceCubesFromMixButton = UIButton()
		self.removeIceCubesFromMixButton.setTitle("-", forState: UIControlState.Normal)
		self.removeIceCubesFromMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.removeIceCubesFromMixButton.titleLabel?.font = self.labelFont
		self.removeIceCubesFromMixButton.sizeToFit()
		self.removeIceCubesFromMixButton.sizeThatFits(CGSize(width: self.removeIceCubesFromMixButton.frame.width + self.kButtonHorizontalPadding, height: self.mixIceCubesLabel.frame.height))
		self.removeIceCubesFromMixButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth), y: self.mixIceCubesLabel.center.y)
		self.removeIceCubesFromMixButton.addTarget(self, action: "removeIceCubesFromMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.removeIceCubesFromMixButton)

		self.numberOfIceCubesToMixLabel = UILabel()
		self.numberOfIceCubesToMixLabel.text = "\(self.iceCubesToBeMixed)"
		self.numberOfIceCubesToMixLabel.textColor = UIColor.blackColor()
		self.numberOfIceCubesToMixLabel.font = self.labelFont
		self.numberOfIceCubesToMixLabel.sizeToFit()
		self.numberOfIceCubesToMixLabel.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 3), y: self.mixIceCubesLabel.center.y)
		containerView.addSubview(self.numberOfIceCubesToMixLabel)

		self.addIceCubesToMixButton = UIButton()
		self.addIceCubesToMixButton.setTitle("+", forState: UIControlState.Normal)
		self.addIceCubesToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.addIceCubesToMixButton.titleLabel?.font = self.labelFont
		self.addIceCubesToMixButton.sizeToFit()
		self.addIceCubesToMixButton.sizeThatFits(CGSize(width: self.addIceCubesToMixButton.frame.width + self.kButtonHorizontalPadding, height: self.mixIceCubesLabel.frame.height))
		self.addIceCubesToMixButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 5), y: self.mixIceCubesLabel.center.y)
		self.addIceCubesToMixButton.addTarget(self, action: "addIceCubesToMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.addIceCubesToMixButton)
	}

	func setupStartDayContainer(containerView: UIView) {
		self.step3Label = UILabel()
		self.step3Label.text = "Step 3: Start Selling Your Brew"
		self.step3Label.textColor = UIColor.blueColor()
		self.step3Label.font = self.labelFont
		self.step3Label.sizeToFit()
		self.step3Label.center = CGPoint(x: containerView.frame.origin.x + (self.step3Label.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.step3Label)

		self.step3Instructions = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: containerView.frame.width * self.kFourth * 3, height: containerView.frame.height * self.kHalf))
		self.step3Instructions.text = "At the end of the day, you will either make or lose money. If you don't have enough money to buy new inventory, then you lose the game."
		self.step3Instructions.textColor = UIColor.blackColor()
		self.step3Instructions.font = self.instructionsFont
		self.step3Instructions.numberOfLines = 4
		self.step3Instructions.center = CGPoint(x: containerView.center.x, y: containerView.frame.height * self.kTwentyFourth * 11)
		containerView.addSubview(self.step3Instructions)

		self.startDayButton = UIButton()
		self.startDayButton.setTitle("Start Day", forState: UIControlState.Normal)
		self.startDayButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.startDayButton.backgroundColor = UIColor.yellowColor()
		self.startDayButton.titleLabel?.font = self.labelFont
		self.startDayButton.sizeToFit()
// TODO: Remove
//		self.startDayButton.sizeThatFits(CGSize(width: containerView.frame.width * self.kHalf, height: containerView.frame.height * self.kThird))
//		self.startDayButton.sizeThatFits(CGSize(width: self.startDayButton.frame.width + self.kButtonHorizontalPadding * 2, height: self.startDayButton.frame.height + self.kButtonHorizontalPadding * 2))
		self.startDayButton.center = CGPoint(x: containerView.center.x, y: containerView.frame.height * self.kTwentyFourth * 20)
		self.startDayButton.addTarget(self, action: "startDayButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.startDayButton)

	}
}

