//
//  main.swift
//  L7_Anastasia_Uzhentseva
//
//  Created by Uzh on 12/12/2018.


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
    let sellOne = try stock.sellItem(itemName: "Product")
    print(sellOne)
} catch StockError.outOfStock {
    print("Position is out of stock")
    
} catch StockError.shippingFalse {
    print("Position is out of stock")
    
} catch StockError.invalidSelection {
    print("No such position in the stock")
}

let sell2 = try? stock.sellItem(itemName: "Pencil")
print(sell2)

let sell3 = try stock.sellItem(itemName: "Ruler")
print(sell3)
