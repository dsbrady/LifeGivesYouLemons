//
//  LemonadeBrain.swift
//  Life Gives You Lemons
//
//  Created by Scott Brady on 10/28/14.
//  Copyright (c) 2014 Spider Monkey Tech. All rights reserved.
//

import Foundation


class LemonadeBrain {

	class func calculateAcidity(lemonade: Lemonade) -> Double {
		var acidity = 0.0

		acidity = Double(lemonade.numberOfIceCubes) / Double(lemonade.numberOfLemons)

		return acidity
	}

	class func calculateNumberOfGlasses(lemonade: Lemonade) -> Int {
		var numberOfGlasses = 0
		let kGlassesPerLemon = 3
		let kGlassesPerIceCube = 2

		numberOfGlasses = lemonade.numberOfLemons * kGlassesPerLemon + lemonade.numberOfIceCubes * kGlassesPerIceCube

		return numberOfGlasses
	}

	class func willCustomerPurchase(customer:Customer, lemonade:Lemonade) -> Bool {
		var willPurchase = false

		let kAcidicPreferenceMax = 0.4
		let kNeutralPreferenceMax = 0.6
		let kDilutedPreferenceMax = 1.0

		// Do the comparisons, with lemonade acidity < 1 is "acidic", = 1 is "neutral" and > 1 is "diluted"
		if lemonade.acidity < 1.0 && customer.acidityPreference < kAcidicPreferenceMax {
			willPurchase = true
		}
		else if lemonade.acidity == 1.0 && customer.acidityPreference >= kAcidicPreferenceMax && customer.acidityPreference < kNeutralPreferenceMax {
			willPurchase = true
		}
		else if lemonade.acidity > 1.0 && customer.acidityPreference >= kNeutralPreferenceMax {
			willPurchase = true
		}

		return willPurchase
	}
}