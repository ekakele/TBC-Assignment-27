//
//  ShopView.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 12.12.23.
//

import SwiftUI

struct ShopView: View {
    //MARK: Properties
    @StateObject private var shopViewModel = ShopViewModel()
    @EnvironmentObject var cart: CartViewModel
    
    //MARK: - Body
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Image("banner")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                        
                        ProductSectionHorizontalScrollView(title: "Vegetables", products: $shopViewModel.vegetables)
                        
                        ProductSectionHorizontalScrollView(title: "Fruits", products: $shopViewModel.fruits)
                        
                        ProductSectionHorizontalScrollView(title: "Meat", products: $shopViewModel.meat)
                        
                        ProductSectionHorizontalScrollView(title: "Seafood", products: $shopViewModel.seafood)
                        
                    }
                    .padding(.horizontal, 12)
                    .navigationBarTitle("Shop Grocery Online", displayMode: .inline)
                }
            }
        }
    }
}

struct ProductSectionHorizontalScrollView: View {
    //MARK: - Properties
    let title: String
    @Binding var products: [Product]
    
    //MARK: - Body
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .bold()
                .foregroundColor(.black)
            
            Spacer()
            
            Text("scroll to see more")
                .font(.system(size: 10))
                .fontWeight(.light)
                .foregroundColor(.blue)
            
            Image(systemName: "arrow.forward")
                .resizable()
                .frame(width: 8, height: 6)
                .foregroundColor(.blue)
                .padding(.trailing, 20)
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach($products) { item in
                    ProductCellView(product: item)
                }
            }
        }
    }
}

//MARK: - Preview
#Preview {
    ShopView().environmentObject(CartViewModel())
}
