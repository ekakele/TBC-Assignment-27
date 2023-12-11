//
//  CartItemModel.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 11.12.23.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let price: Double
    var quantity: Int
    var totalPrice: Double {
        return Double(quantity) * price
       }
}
