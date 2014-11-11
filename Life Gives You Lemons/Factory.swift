//
//  Factory.swift
//  Life Gives You Lemons
//
//  Created by Scott Brady on 10/28/14.
//  Copyright (c) 2014 Spider Monkey Tech. All rights reserved.
//

import Foundation

class Factory {
	class func createCustomers() -> [Customer] {
		var customers:[Customer] = []
		let kMaxNumberOfCustomers = 10
		let numberOfCustomers = Int(arc4random_uniform(UInt32(kMaxNumberOfCustomers))) + 1
		var customer:Customer
		var acidityPreference:Double

		for var i = 0; i < numberOfCustomers; ++i {
			customer = Customer()
			acidityPreference = (Double(arc4random_uniform(UInt32(10))) + 1.0) / 10.0
			customer.acidityPreference = acidityPreference
			customers += [customer]
		}

		return customers
	}

	class func createLemonade(numberOfLemons:Int, numberOfIceCubes:Int) -> Lemonade {
		var lemonade = Lemonade(numberOfLemons: numberOfLemons, numberOfIceCubes: numberOfIceCubes, acidity: 0.0, glassesAvailable: 0)
		lemonade.acidity = LemonadeBrain.calculateAcidity(lemonade)
		lemonade.glassesAvailable = LemonadeBrain.calculateNumberOfGlasses(lemonade)

		return lemonade
	}
}