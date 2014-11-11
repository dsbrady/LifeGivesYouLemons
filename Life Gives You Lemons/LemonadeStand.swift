//
//  LemonadeStand.swift
//  Life Gives You Lemons
//
//  Created by Scott Brady on 10/29/14.
//  Copyright (c) 2014 Spider Monkey Tech. All rights reserved.
//

import Foundation

class LemonadeStand {
	// stats properties
	var currentMoney = 10.00
	var currentLemons = 1
	var currentIceCubes = 1
	var lemonsToBePurchased = 0
	var iceCubesToBePurchased = 0
	var lemonsToBeMixed = 0
	var iceCubesToBeMixed = 0
	var lifetimeSalesRevenue = 0.00
	var lifetimeSalesNumber = 0

	// Constants
	let kLemonadePrice = 1.00

	func calculateSales(customers:[Customer], lemonade:Lemonade) -> Double {
		var sales = 0.00
		var glassesSold = 0

		for customer in customers {
			if LemonadeBrain.willCustomerPurchase(customer, lemonade:lemonade) {
				sales += self.kLemonadePrice
				glassesSold++

				// If we've sold out, just break out of the loop
				if lemonade.glassesAvailable == glassesSold {
					break;
				}
			}
		}

		self.lifetimeSalesRevenue += sales
		self.lifetimeSalesNumber += glassesSold

		return sales
	}

	func endDay() {
		self.lemonsToBePurchased = 0
		self.iceCubesToBePurchased = 0
		self.lemonsToBeMixed = 0
		self.iceCubesToBeMixed = 0

	}

	func runDay(customers:[Customer], lemonade:Lemonade) -> Day {
		var day = Day()
		day.sales = calculateSales(customers, lemonade: lemonade)
		day.numberOfCustomers = customers.count
		day.numberSold = Int(day.sales / self.kLemonadePrice)

		self.currentMoney += day.sales
		self.currentLemons -= self.lemonsToBeMixed
		self.currentIceCubes -= self.iceCubesToBeMixed

		return day
	}

}