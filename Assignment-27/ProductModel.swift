//
//  ProductModel.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 10.12.23.
//

import Foundation



struct Product: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    var price: String
    //    var stockAmount: Int
}


struct ProductList {
    static let Vegetables = [
        Product(
            image: "broccoli",
            title: "Broccoli",
            price: "3.99$ (kg)"
        ),
        Product(
            image: "carrot",
            title: "Carrot",
            price: "0.99$ (kg)"
        ),
        Product(
            image: "pepper",
            title: "Bell Pepper",
            price: "5.99$ (kg)"
        ),
        Product(
            image: "ginger",
            title: "Ginger",
            price: "4.99$ (kg)"
        ),
        Product(
            image: "lettuce",
            title: "Lettuce",
            price: "1.99$ (kg)"
        ),
        Product(
            image: "squash",
            title: "Butternut Squash",
            price: "3.99$ (kg)"
        )
    ]
    
    static let Fruits = [
        Product(
            image: "strawberry",
            title: "Strawberry",
            price: "6.99$ (kg)"
        ),
        Product(
            image: "banana",
            title: "Banana",
            price: "3.99$ (kg)"
        ),
        Product(
            image: "blueberry",
            title: "Organic Blueberry",
            price: "14.99$ (kg)"
        )
    ]
    
    static let Meat = [
        Product(
            image: "beef",
            title: "Beef",
            price: "18.99$ (kg)"
        ),
        Product(
            image: "pork",
            title: "Pork Steak",
            price: "12.99$ (kg)"
        ),
        Product(
            image: "chicken",
            title: "Chicken Breast",
            price: "9.99$ (kg)"
        )
    ]
    
    static let Seafood = [
        Product(
            image: "salmon",
            title: "Salmon Fillet",
            price: "39.99$ (kg)"
        ),
        Product(
            image: "shrimps",
            title: "Shrimps",
            price: "34.99$ (kg)"
        )
    ]
}

