//
//  main.swift
//  L7_Anastasia_Uzhentseva
//
//  Created by Uzh on 12/12/2018.
//  Copyright © 2018 Uzh. All rights reserved.
//

import Foundation

enum StockError: Error {
    case shippingFalse
    case outOfStock
    case invalidSelection
}

struct Product { // item positions awailable in the store
    let name: String
}

struct Item { // position in the warehouse
    let product: Product
    var count: Int // amount of items
    var shipping: Bool // allow shipping or not
}

class Stock {
    
    var inventory = [ // our positions in the stock
        "Rubber": Item(product: Product(name: "Rubber"), count: 20, shipping: true),
        "Pencil": Item(product: Product(name: "Pencil"), count: 300, shipping: false),
        "Ruler": Item(product: Product(name: "Ruler"), count: 25, shipping: true),
        "Pen": Item(product: Product(name: "Pen"), count: 0, shipping: false)
    ]
    
    func sellItem(itemName name: String) throws -> Product { // getting our Items out of Stock
        
        guard let item = inventory[name] else {
            throw StockError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw StockError.outOfStock
        }
        
        guard item.shipping == true else {
            throw StockError.shippingFalse
        }
        
        var newItem = item
        newItem.count -= 1
        
        return newItem.product
        
    }
}

let stock = Stock()

do {
    let sellOne = try? stock.sellItem(itemName: "Product")
} catch StockError.outOfStock {
    print("Position is out of stock")
} catch StockError.shippingFalse {
    print("Position is out of stock")
} catch StockError.invalidSelection {
    print("No such position in the stock")
}

print(try stock.sellItem(itemName: "Pen"))


//enum TruckErrors: Error {
//    case BelowZero
//    case DivideByZero
//}
//
//class TrunkCar {
//    var time: Double
//    var distance: Double
//    let capacity: Double
//    var currentLoad: Double
//
//    init(time: Double, distance: Double, capacity: Double, currentLoad: Double) {
//        self.time = time
//        self.distance = distance
//        self.capacity = capacity
//        self.currentLoad = currentLoad
//    }
//
//    func calculateSpeed() throws -> Double {
//        return self.distance / self.time
//
//        guard time > 0 else {
//            throw TruckErrors.DivideByZero
//        }
//    }
//
//    func loadTruck (weight: Double) throws -> String {
//        let load = self.currentLoad + weight
//
//        guard load > 0 else {
//            throw TruckErrors.BelowZero
//        }
//    }
//}
//
//extension TrunkCar : CustomStringConvertible {
//    var description: String {
//        return "Грузовик проехал \(self.distance) км за \(self.time) часов, скорость составила \(self.calculateSpeed()) км/ч. Назрузка составила \(self.currentLoad) из \(self.capacity) возможных.\n"
//    }
//}
//
//do {
//    let trunkCar1 = try TrunkCar(time: 8, distance: 600, capacity: 500, currentLoad: 100)
//}
//
//
//
