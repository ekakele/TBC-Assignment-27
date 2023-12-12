//
//  ShopViewModel.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 12.12.23.
//

import Foundation

final class ShopViewModel: ObservableObject {
    @Published var vegetables = ProductList.Vegetables
    @Published var fruits = ProductList.Fruits
    @Published var meat = ProductList.Meat
    @Published var seafood = ProductList.Seafood
}
