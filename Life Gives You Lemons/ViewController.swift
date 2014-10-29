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

	// Costs / Revenues
	let kLemonCost = 2
	let kIceCubeCost = 1

	// Fonts / Colors
	let kLabelFont = UIFont(name: "Menlo-Bold", size:18)
	let kInstructionsFont = UIFont(name: "Baskerville", size:17)
	let kProfitColor = UIColor(red: 0.0/255.0, green: 200.0/255.0, blue: 0.0/255.0, alpha: 1.0)
	let kLossColor = UIColor.redColor()

	// Objects
	var customers:[Customer] = []
	var lemonade:Lemonade = Lemonade()
	var lemonadeStand:LemonadeStand = LemonadeStand()
	var day:Day = Day()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setupContainerViews()
		setupStatsContainer(self.statsContainer)
		setupPurchaseContainer(self.purchaseContainer)
		setupMixContainer(self.mixContainer)
		setupStartDayContainer(self.startDayContainer)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: button functions
	func addLemonsToPurchaseButtonPressed(button: UIButton) {
		if self.kLemonCost > self.lemonadeStand.currentMoney {
			showAlertWithText(header: "Insufficient Funds", message: "You don't have enough money to add another lemon")
		}
		else {
			self.lemonadeStand.lemonsToBePurchased++
			self.lemonadeStand.currentLemons++
			self.lemonadeStand.currentMoney -= self.kLemonCost
		}
		updatePurchaseContainerView()
	}

	func removeLemonsFromPurchaseButtonPressed(button: UIButton) {
		if self.lemonadeStand.lemonsToBePurchased > 0 {
			self.lemonadeStand.lemonsToBePurchased--
			self.lemonadeStand.currentLemons--
			self.lemonadeStand.currentMoney += self.kLemonCost
		}

		updatePurchaseContainerView()
	}

	func addIceCubesToPurchaseButtonPressed(button: UIButton) {
		if self.kIceCubeCost > self.lemonadeStand.currentMoney {
			showAlertWithText(header: "Insufficient Funds", message: "You don't have enough money to add another ice cube")
		}
		else {
			self.lemonadeStand.iceCubesToBePurchased++
			self.lemonadeStand.currentIceCubes++
			self.lemonadeStand.currentMoney -= self.kIceCubeCost
		}
		updatePurchaseContainerView()
	}

	func removeIceCubesFromPurchaseButtonPressed(button: UIButton) {
		if self.lemonadeStand.iceCubesToBePurchased > 0 {
			self.lemonadeStand.iceCubesToBePurchased--
			self.lemonadeStand.currentIceCubes--
			self.lemonadeStand.currentMoney += self.kIceCubeCost
		}

		updatePurchaseContainerView()
	}

	func addLemonsToMixButtonPressed(button: UIButton) {
		if self.lemonadeStand.lemonsToBeMixed == self.lemonadeStand.currentLemons {
			showAlertWithText(header: "Not Enough Lemons", message: "You don't have enough lemons to add another to the mix")
		}
		else {
			self.lemonadeStand.lemonsToBeMixed++
		}
		updateMixContainerView()
	}

	func removeLemonsFromMixButtonPressed(button: UIButton) {
		if self.lemonadeStand.lemonsToBeMixed > 0 {
			self.lemonadeStand.lemonsToBeMixed--
		}

		updateMixContainerView()
	}

	func addIceCubesToMixButtonPressed(button: UIButton) {
		if self.lemonadeStand.iceCubesToBeMixed == self.lemonadeStand.currentIceCubes {
			showAlertWithText(header: "Not Enough Ice", message: "You don't have enough ice cubes to add another to the mix")
		}
		else {
			self.lemonadeStand.iceCubesToBeMixed++
		}
		updateMixContainerView()
	}

	func removeIceCubesFromMixButtonPressed(button: UIButton) {
		if self.lemonadeStand.iceCubesToBeMixed > 0 {
			self.lemonadeStand.iceCubesToBeMixed--
		}

		updateMixContainerView()
	}

	func startDayButtonPressed(button: UIButton) {
		startDay()
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
		self.youHaveLabel.font = self.kLabelFont
		self.youHaveLabel.sizeToFit()
		self.youHaveLabel.center = CGPoint(x: containerView.frame.origin.x + (self.youHaveLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.youHaveLabel)

		self.youHaveMoneyLabel = UILabel()
		self.youHaveMoneyLabel.text = "$\(self.lemonadeStand.currentMoney)"
		self.youHaveMoneyLabel.textColor = self.kProfitColor
		self.youHaveMoneyLabel.font = self.kLabelFont
		self.youHaveMoneyLabel.sizeToFit()
		self.youHaveMoneyLabel.center = CGPoint(x: containerView.frame.origin.x + (containerView.frame.width * self.kHalf) + (self.youHaveMoneyLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.youHaveMoneyLabel)

		self.youHaveLemonsLabel = UILabel()
		if (self.lemonadeStand.currentLemons != 1) {
			self.youHaveLemonsLabel.text = "\(self.lemonadeStand.currentLemons) Lemons"
		}
		else {
			self.youHaveLemonsLabel.text = "\(self.lemonadeStand.currentLemons) Lemon"
		}
		self.youHaveLemonsLabel.textColor = UIColor.blackColor()
		self.youHaveLemonsLabel.font = self.kLabelFont
		self.youHaveLemonsLabel.sizeToFit()
		self.youHaveLemonsLabel.center = CGPoint(x: containerView.frame.origin.x + (containerView.frame.width * self.kHalf) + (self.youHaveLemonsLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth * 3)
		containerView.addSubview(self.youHaveLemonsLabel)

		self.youHaveIceCubesLabel = UILabel()
		if (self.lemonadeStand.currentIceCubes != 1) {
			self.youHaveIceCubesLabel.text = "\(self.lemonadeStand.currentIceCubes) Ice Cubes"
		}
		else {
			self.youHaveIceCubesLabel.text = "\(self.lemonadeStand.currentIceCubes) Ice Cube"
		}
		self.youHaveIceCubesLabel.textColor = UIColor.blackColor()
		self.youHaveIceCubesLabel.font = self.kLabelFont
		self.youHaveIceCubesLabel.sizeToFit()
		self.youHaveIceCubesLabel.center = CGPoint(x: containerView.frame.origin.x + (containerView.frame.width * self.kHalf) + (self.youHaveIceCubesLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth * 5)
		containerView.addSubview(self.youHaveIceCubesLabel)
	}

	func setupPurchaseContainer(containerView: UIView) {
		self.step1Label = UILabel()
		self.step1Label.text = "Step 1: Purchase Supplies"
		self.step1Label.textColor = UIColor.blueColor()
		self.step1Label.font = self.kLabelFont
		self.step1Label.sizeToFit()
		self.step1Label.center = CGPoint(x: containerView.frame.origin.x + (self.step1Label.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.step1Label)

		self.purchaseLemonsLabel = UILabel()
		self.purchaseLemonsLabel.text = "Lemons for $\(self.kLemonCost):"
		self.purchaseLemonsLabel.textColor = UIColor.blackColor()
		self.purchaseLemonsLabel.font = self.kLabelFont
		self.purchaseLemonsLabel.sizeToFit()
		self.purchaseLemonsLabel.center = CGPoint(x: containerView.center.x - (self.purchaseLemonsLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kHalf)
		self.purchaseLemonsLabel.textAlignment = NSTextAlignment.Right
		containerView.addSubview(self.purchaseLemonsLabel)

		self.removeLemonsFromPurchaseButton = UIButton()
		self.removeLemonsFromPurchaseButton.setTitle("-", forState: UIControlState.Normal)
		self.removeLemonsFromPurchaseButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.removeLemonsFromPurchaseButton.titleLabel?.font = self.kLabelFont
		self.removeLemonsFromPurchaseButton.sizeToFit()
		self.removeLemonsFromPurchaseButton.sizeThatFits(CGSize(width: self.removeLemonsFromPurchaseButton.frame.width + self.kButtonHorizontalPadding, height: self.purchaseLemonsLabel.frame.height))
		self.removeLemonsFromPurchaseButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth), y: self.purchaseLemonsLabel.center.y)
		self.removeLemonsFromPurchaseButton.addTarget(self, action: "removeLemonsFromPurchaseButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.removeLemonsFromPurchaseButton)

		self.numberOfLemonsToPurchaseLabel = UILabel()
		self.numberOfLemonsToPurchaseLabel.text = "\(self.lemonadeStand.lemonsToBePurchased)"
		self.numberOfLemonsToPurchaseLabel.textColor = UIColor.blackColor()
		self.numberOfLemonsToPurchaseLabel.font = self.kLabelFont
		self.numberOfLemonsToPurchaseLabel.sizeToFit()
		self.numberOfLemonsToPurchaseLabel.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kFourth), y: self.purchaseLemonsLabel.center.y)
		containerView.addSubview(self.numberOfLemonsToPurchaseLabel)

		self.addLemonsToPurchaseButton = UIButton()
		self.addLemonsToPurchaseButton.setTitle("+", forState: UIControlState.Normal)
		self.addLemonsToPurchaseButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.addLemonsToPurchaseButton.titleLabel?.font = self.kLabelFont
		self.addLemonsToPurchaseButton.sizeToFit()
		self.addLemonsToPurchaseButton.sizeThatFits(CGSize(width: self.addLemonsToPurchaseButton.frame.width + self.kButtonHorizontalPadding, height: self.purchaseLemonsLabel.frame.height))
		self.addLemonsToPurchaseButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 5), y: self.purchaseLemonsLabel.center.y)
		self.addLemonsToPurchaseButton.addTarget(self, action: "addLemonsToPurchaseButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.addLemonsToPurchaseButton)

		self.purchaseIceCubesLabel = UILabel()
		self.purchaseIceCubesLabel.text = "Ice cubes for $\(self.kIceCubeCost):"
		self.purchaseIceCubesLabel.textColor = UIColor.blackColor()
		self.purchaseIceCubesLabel.font = self.kLabelFont
		self.purchaseIceCubesLabel.sizeToFit()
		self.purchaseIceCubesLabel.center = CGPoint(x: containerView.center.x - (self.purchaseIceCubesLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth * 5)
		self.purchaseIceCubesLabel.textAlignment = NSTextAlignment.Right
		containerView.addSubview(self.purchaseIceCubesLabel)

		self.removeIceCubesFromPurchaseButton = UIButton()
		self.removeIceCubesFromPurchaseButton.setTitle("-", forState: UIControlState.Normal)
		self.removeIceCubesFromPurchaseButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.removeIceCubesFromPurchaseButton.titleLabel?.font = self.kLabelFont
		self.removeIceCubesFromPurchaseButton.sizeToFit()
		self.removeIceCubesFromPurchaseButton.sizeThatFits(CGSize(width: self.removeIceCubesFromPurchaseButton.frame.width + self.kButtonHorizontalPadding, height: self.purchaseIceCubesLabel.frame.height))
		self.removeIceCubesFromPurchaseButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth), y: self.purchaseIceCubesLabel.center.y)
		self.removeIceCubesFromPurchaseButton.addTarget(self, action: "removeIceCubesFromPurchaseButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.removeIceCubesFromPurchaseButton)

		self.numberOfIceCubesToPurchaseLabel = UILabel()
		self.numberOfIceCubesToPurchaseLabel.text = "\(self.lemonadeStand.iceCubesToBePurchased)"
		self.numberOfIceCubesToPurchaseLabel.textColor = UIColor.blackColor()
		self.numberOfIceCubesToPurchaseLabel.font = self.kLabelFont
		self.numberOfIceCubesToPurchaseLabel.sizeToFit()
		self.numberOfIceCubesToPurchaseLabel.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 3), y: self.purchaseIceCubesLabel.center.y)
		containerView.addSubview(self.numberOfIceCubesToPurchaseLabel)

		self.addIceCubesToPurchaseButton = UIButton()
		self.addIceCubesToPurchaseButton.setTitle("+", forState: UIControlState.Normal)
		self.addIceCubesToPurchaseButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.addIceCubesToPurchaseButton.titleLabel?.font = self.kLabelFont
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
		self.step2Label.font = self.kLabelFont
		self.step2Label.sizeToFit()
		self.step2Label.center = CGPoint(x: containerView.frame.origin.x + (self.step2Label.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.step2Label)

		self.step2Instructions = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: containerView.frame.width * self.kFourth * 3, height: containerView.frame.height * self.kTwentyFourth * 7))
		self.step2Instructions.text = "Do your customers prefer more lemons or ice cubes today?"
		self.step2Instructions.textColor = UIColor.blackColor()
		self.step2Instructions.font = self.kInstructionsFont
		self.step2Instructions.numberOfLines = 2
		self.step2Instructions.center = CGPoint(x: containerView.center.x, y: containerView.frame.height * self.kTwentyFourth * 9)
		containerView.addSubview(self.step2Instructions)

		self.mixLemonsLabel = UILabel()
		self.mixLemonsLabel.text = "Lemons:"
		self.mixLemonsLabel.textColor = UIColor.blackColor()
		self.mixLemonsLabel.font = self.kLabelFont
		self.mixLemonsLabel.sizeToFit()
		self.mixLemonsLabel.center = CGPoint(x: containerView.center.x - (self.mixLemonsLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kTwelfth * 7)
		self.mixLemonsLabel.textAlignment = NSTextAlignment.Right
		containerView.addSubview(self.mixLemonsLabel)

		self.removeLemonsFromMixButton = UIButton()
		self.removeLemonsFromMixButton.setTitle("-", forState: UIControlState.Normal)
		self.removeLemonsFromMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.removeLemonsFromMixButton.titleLabel?.font = self.kLabelFont
		self.removeLemonsFromMixButton.sizeToFit()
		self.removeLemonsFromMixButton.sizeThatFits(CGSize(width: self.removeLemonsFromMixButton.frame.width + self.kButtonHorizontalPadding, height: self.mixLemonsLabel.frame.height))
		self.removeLemonsFromMixButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth), y: self.mixLemonsLabel.center.y)
		self.removeLemonsFromMixButton.addTarget(self, action: "removeLemonsFromMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.removeLemonsFromMixButton)

		self.numberOfLemonsToMixLabel = UILabel()
		self.numberOfLemonsToMixLabel.text = "\(self.lemonadeStand.lemonsToBeMixed)"
		self.numberOfLemonsToMixLabel.textColor = UIColor.blackColor()
		self.numberOfLemonsToMixLabel.font = self.kLabelFont
		self.numberOfLemonsToMixLabel.sizeToFit()
		self.numberOfLemonsToMixLabel.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kFourth), y: self.mixLemonsLabel.center.y)
		containerView.addSubview(self.numberOfLemonsToMixLabel)

		self.addLemonsToMixButton = UIButton()
		self.addLemonsToMixButton.setTitle("+", forState: UIControlState.Normal)
		self.addLemonsToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.addLemonsToMixButton.titleLabel?.font = self.kLabelFont
		self.addLemonsToMixButton.sizeToFit()
		self.addLemonsToMixButton.sizeThatFits(CGSize(width: self.addLemonsToMixButton.frame.width + self.kButtonHorizontalPadding, height: self.mixLemonsLabel.frame.height))
		self.addLemonsToMixButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 5), y: self.mixLemonsLabel.center.y)
		self.addLemonsToMixButton.addTarget(self, action: "addLemonsToMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.addLemonsToMixButton)

		self.mixIceCubesLabel = UILabel()
		self.mixIceCubesLabel.text = "Ice cubes:"
		self.mixIceCubesLabel.textColor = UIColor.blackColor()
		self.mixIceCubesLabel.font = self.kLabelFont
		self.mixIceCubesLabel.sizeToFit()
		self.mixIceCubesLabel.center = CGPoint(x: containerView.center.x - (self.mixIceCubesLabel.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth * 5)
		self.mixIceCubesLabel.textAlignment = NSTextAlignment.Right
		containerView.addSubview(self.mixIceCubesLabel)

		self.removeIceCubesFromMixButton = UIButton()
		self.removeIceCubesFromMixButton.setTitle("-", forState: UIControlState.Normal)
		self.removeIceCubesFromMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.removeIceCubesFromMixButton.titleLabel?.font = self.kLabelFont
		self.removeIceCubesFromMixButton.sizeToFit()
		self.removeIceCubesFromMixButton.sizeThatFits(CGSize(width: self.removeIceCubesFromMixButton.frame.width + self.kButtonHorizontalPadding, height: self.mixIceCubesLabel.frame.height))
		self.removeIceCubesFromMixButton.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth), y: self.mixIceCubesLabel.center.y)
		self.removeIceCubesFromMixButton.addTarget(self, action: "removeIceCubesFromMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.removeIceCubesFromMixButton)

		self.numberOfIceCubesToMixLabel = UILabel()
		self.numberOfIceCubesToMixLabel.text = "\(self.lemonadeStand.iceCubesToBeMixed)"
		self.numberOfIceCubesToMixLabel.textColor = UIColor.blackColor()
		self.numberOfIceCubesToMixLabel.font = self.kLabelFont
		self.numberOfIceCubesToMixLabel.sizeToFit()
		self.numberOfIceCubesToMixLabel.center = CGPoint(x: containerView.center.x + (containerView.frame.width * self.kTwelfth * 3), y: self.mixIceCubesLabel.center.y)
		containerView.addSubview(self.numberOfIceCubesToMixLabel)

		self.addIceCubesToMixButton = UIButton()
		self.addIceCubesToMixButton.setTitle("+", forState: UIControlState.Normal)
		self.addIceCubesToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.addIceCubesToMixButton.titleLabel?.font = self.kLabelFont
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
		self.step3Label.font = self.kLabelFont
		self.step3Label.sizeToFit()
		self.step3Label.center = CGPoint(x: containerView.frame.origin.x + (self.step3Label.frame.width * self.kHalf), y: containerView.frame.height * self.kSixth)
		containerView.addSubview(self.step3Label)

		self.step3Instructions = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: containerView.frame.width * self.kFourth * 3, height: containerView.frame.height * self.kHalf))
		self.step3Instructions.text = "At the end of the day, you will either make or lose money. If you don't have enough money to buy new inventory, then you lose the game."
		self.step3Instructions.textColor = UIColor.blackColor()
		self.step3Instructions.font = self.kInstructionsFont
		self.step3Instructions.numberOfLines = 4
		self.step3Instructions.center = CGPoint(x: containerView.center.x, y: containerView.frame.height * self.kTwentyFourth * 11)
		containerView.addSubview(self.step3Instructions)

		self.startDayButton = UIButton()
		self.startDayButton.setTitle("Start Day", forState: UIControlState.Normal)
		self.startDayButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		self.startDayButton.backgroundColor = UIColor.yellowColor()
		self.startDayButton.titleLabel?.font = self.kLabelFont
		self.startDayButton.sizeToFit()
		self.startDayButton.center = CGPoint(x: containerView.center.x, y: containerView.frame.height * self.kTwentyFourth * 20)
		self.startDayButton.addTarget(self, action: "startDayButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		containerView.addSubview(self.startDayButton)

	}

	// MARK: Helper functions
	func endDay() {
		self.lemonadeStand.endDay()
		updatePurchaseContainerView()
		updateMixContainerView()
		updateStatsContainerView()

		if isGameOver() {
			showAlertWithText(header: "Game Over!", message: "You ran out of lemons and can't afford to buy more. Your stand is out of business! You sold a total of $\(self.lemonadeStand.lifetimeSales) in lemonade. Press \"OK\" to start over.")
		}
		else {
			showAlertWithText(header: "Day Complete", message: "You had \(self.day.numberOfCustomers) customer(s) who bought \(self.day.numberSold) lemonade(s), for total sales of $\(self.day.sales)")
		}

	}

	func isGameOver() -> Bool {
		var isOver = false

		// Game over, man! -- they have no lemons and can't buy any more
		if self.lemonadeStand.currentLemons == 0 && self.lemonadeStand.currentMoney < self.kLemonCost {
			isOver = true
		}

		return isOver
	}

	func showAlertWithText(header: String = "Warning", message: String) {
		var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
		self.presentViewController(alert, animated: true, completion: nil)
	}

	func startDay() {
		if self.lemonadeStand.lemonsToBeMixed == 0 {
			showAlertWithText(header: "No Lemons", message: "You can't make lemonade with lemons (that's called \"water\". Add at least one lemon before starting the day.")
		}
		else {
			self.customers = Factory.createCustomers()
			self.lemonade = Factory.createLemonade(self.lemonadeStand.lemonsToBeMixed, numberOfIceCubes: self.lemonadeStand.iceCubesToBeMixed)
			self.day = lemonadeStand.runDay(self.customers, lemonade:self.lemonade)
			endDay()
		}
	}

	func updateMixContainerView() {
		self.numberOfLemonsToMixLabel.text = "\(self.lemonadeStand.lemonsToBeMixed)"
		self.numberOfLemonsToMixLabel.sizeToFit()
		self.numberOfIceCubesToMixLabel.text = "\(self.lemonadeStand.iceCubesToBeMixed)"
		self.numberOfIceCubesToMixLabel.sizeToFit()
	}

	func updatePurchaseContainerView() {
		self.numberOfLemonsToPurchaseLabel.text = ("\(self.lemonadeStand.lemonsToBePurchased)")
		self.numberOfIceCubesToPurchaseLabel.text = ("\(self.lemonadeStand.iceCubesToBePurchased)")
		self.numberOfLemonsToPurchaseLabel.sizeToFit()
		self.numberOfIceCubesToPurchaseLabel.sizeToFit()
		updateStatsContainerView()
	}

	func updateStatsContainerView() {
		self.youHaveMoneyLabel.text = "$\(self.lemonadeStand.currentMoney)"
		if self.lemonadeStand.currentMoney <= 0 {
			self.youHaveMoneyLabel.textColor = self.kLossColor
		}
		else {
			self.youHaveMoneyLabel.textColor = self.kProfitColor
		}
		if self.lemonadeStand.currentLemons == 1 {
			self.youHaveLemonsLabel.text = "\(self.lemonadeStand.currentLemons) Lemon"
		}
		else {
			self.youHaveLemonsLabel.text = "\(self.lemonadeStand.currentLemons) Lemons"
		}
		if self.lemonadeStand.currentIceCubes == 1 {
			self.youHaveIceCubesLabel.text = "\(self.lemonadeStand.currentIceCubes) Ice Cube"
		}
		else {
			self.youHaveIceCubesLabel.text = "\(self.lemonadeStand.currentIceCubes) Ice Cubes"
		}

		self.youHaveMoneyLabel.sizeToFit()
		self.youHaveLemonsLabel.sizeToFit()
		self.youHaveIceCubesLabel.sizeToFit()
	}

}

