//
//  CartViewModel.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 12.12.23.
//

import SwiftUI

final class CartViewModel: ObservableObject {
    //MARK: - Properties
    @Published var items: [Product] = []
    
    var totalPrice: String {
        let total = items.reduce(0) { sum, product in
            sum + (product.price * Double(product.quantity))
        }
        return String(format: "%.2f", total)
    }
    
    @Published var discountedTotal: Double = 0.0
    
    //MARK: - Methods
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
    
    func removeAllFromCart(product: Product) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            if items[index].quantity > 0 {
                items.remove(at: index)
                applyDiscount()
            }
        }
    }
    
    func applyDiscount() {
        let total = items.reduce(0) { sum, product in
            sum + (product.price * Double(product.quantity))
        }
        discountedTotal = total * 0.7
    }
}
