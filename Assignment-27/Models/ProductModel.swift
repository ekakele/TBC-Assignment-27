//
//  ProductModel.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 10.12.23.
//

import Foundation

struct Product: Identifiable {
    //MARK: - Properties
    let id = UUID()
    let image: String
    let title: String
    let price: Double
    var quantity: Int = 0
    //    var stockAmount: Int
}


struct ProductList {
    //MARK: - Properties
    static let Vegetables = [
        Product(
            image: "broccoli",
            title: "Broccoli",
            price: 3.99
        ),
        Product(
            image: "carrot",
            title: "Carrot",
            price: 0.99
        ),
        Product(
            image: "pepper",
            title: "Bell Pepper",
            price: 5.99
        ),
        Product(
            image: "ginger",
            title: "Ginger",
            price: 4.99
        ),
        Product(
            image: "lettuce",
            title: "Lettuce",
            price: 1.99
        ),
        Product(
            image: "squash",
            title: "Butternut Squash",
            price: 3.99
        )
    ]
    
    static let Fruits = [
        Product(
            image: "strawberry",
            title: "Strawberry",
            price: 6.99
        ),
        Product(
            image: "banana",
            title: "Banana",
            price: 3.99
        ),
        Product(
            image: "blueberry",
            title: "Organic Blueberry",
            price: 14.99
        ),
        Product(
            image: "apple",
            title: "Red Apple",
            price: 2.99
        ),
        Product(
            image: "kiwi",
            title: "Organic Kiwi",
            price: 6.99
        )
    ]
    
    static let Meat = [
        Product(
            image: "beef",
            title: "Beef",
            price: 18.99
        ),
        Product(
            image: "pork",
            title: "Pork Steak",
            price: 12.99
        ),
        Product(
            image: "chicken",
            title: "Chicken Breast",
            price: 9.99
        )
    ]
    
    static let Seafood = [
        Product(
            image: "salmon",
            title: "Salmon Fillet",
            price: 39.99
        ),
        Product(
            image: "shrimps",
            title: "Shrimps",
            price: 34.99
        ),
        Product(
            image: "oyster",
            title: "Oyster",
            price: 15.99
        ),
        Product(
            image: "mussel",
            title: "Mussel",
            price: 19.99
        )
    ]
}


//MARK: Product extension
extension Product {
    var formattedPrice: String {
        return String(format: "%.2f", floor(self.price * 100) / 100)
    }
}
