//
//  ProductCellViewModel.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 12.12.23.
//

import Foundation

final class ProductCellViewModel: Identifiable, ObservableObject {
    //MARK: - Properties
    let id = UUID()
    var product: Product
    var cartViewModel: CartViewModel
    
    //MARK: - Init
    init(product: Product, cartViewModel: CartViewModel) {
        self.product = product
        self.cartViewModel = cartViewModel
    }
    
    //MARK: - Methods
    func incrementQuantity() {
        cartViewModel.addToCart(product: product)
    }
    
    func decrementQuantity() {
        cartViewModel.removeFromCart(product: product)
    }
    
    func getQuantity() -> Int {
        if let index = cartViewModel.items.firstIndex(where: { $0.id == product.id }) {
            return cartViewModel.items[index].quantity
        }
        
        return 0
    }
}
