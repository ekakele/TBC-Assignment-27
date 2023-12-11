//
//  CartModel.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 11.12.23.
//

import Foundation

class CartModel: ObservableObject {
    @Published var items: [Product] = []
    
    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            items[index].quantity += 1
        } else {
            var newProduct = product
            newProduct.quantity = 1
            items.append(newProduct)
        }
    }
    
    func removeFromCart(product: Product) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
    }
    
    
}

