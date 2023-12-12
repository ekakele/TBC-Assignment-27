//
//  GroceryShopTabView.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 10.12.23.
//

import SwiftUI

struct GroceryShopTabView: View {
    //MARK: - Properties
    @ObservedObject var cart = CartViewModel()
    
    //MARK: - Body
    var body: some View {
        TabView {
            ShopView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Shop")
                }
                .environmentObject(cart)
            
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Shop")
                }
                .environmentObject(cart)
                .badge(cart.items.count)
        }
        .accentColor(.appGreen)
    }
}

//MARK: - Preview
#Preview {
    GroceryShopTabView()
}
