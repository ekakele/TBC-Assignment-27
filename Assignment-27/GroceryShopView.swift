//
//  ContentView.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 10.12.23.
//

import SwiftUI

struct GroceryShopTabView: View {
    @ObservedObject var cart = CartModel()
    
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

struct ShopView: View {
    //MARK: State Properties
    @State private var vegetables = ProductList.Vegetables
    @State private var fruits = ProductList.Fruits
    @State private var meat = ProductList.Meat
    @State private var seafood = ProductList.Seafood
    
    @EnvironmentObject var cart: CartModel
    
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
                        
                        ProductSectionHorizontalScrollView(title: "Vegetables", products: $vegetables)
                        
                        ProductSectionHorizontalScrollView(title: "Fruits", products: $fruits)
                        
                        ProductSectionHorizontalScrollView(title: "Meat", products: $meat)
                        
                        ProductSectionHorizontalScrollView(title: "Seafood", products: $seafood)
                        
                    }
                    .padding(.horizontal, 12)
                    .navigationBarTitle("Shop Grocery Online", displayMode: .inline)
                }
            }
        }
    }
}

struct CartView: View {
    //MARK: - Properties
    @EnvironmentObject var cart: CartModel
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List(cart.items) { item in
                CartItemRowView(item: item)
            }
            .navigationBarTitle("My Cart", displayMode: .inline)
        }
    }
}

struct CartItemRowView: View {
    let item: Product
    
    var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.system(size: 20))
                    .bold()
                
                Text("1 kg price x \(item.quantity) Qty")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            let rowTotalPrice = item.price * Double(item.quantity)
            let formattedRowTotalPrice = String(format: "%.2f", rowTotalPrice)
            
            Text("\(formattedRowTotalPrice)$")
                .font(.system(size: 14))
                .overlay(
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.appGreen)
                        .opacity(0.2)
                )
        }
        .frame(width: .infinity, height: 40)
        .padding(.vertical, 10)
        .padding(.horizontal, 4)
    }
}


//MARK: - ScrollView
struct ProductSectionHorizontalScrollView: View {
    //MARK: - Properties
    let title: String
    
    //MARK: - Binding Properties
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
                    ProductCell(product: item)
                }
            }
        }
    }
}


//MARK: - ProductCell
struct ProductCell: View {
    //MARK: - Properties
    @Binding var product: Product
    
    @State private var quantity = 0
    
    @EnvironmentObject var cart: CartModel
    
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            Image("\(product.image)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 60)
            
            //title & price stack
            VStack(spacing: 2) {
                Text("\(product.title)")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.black)
                
                Text("\(product.formattedPrice)$ (kg)")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }.padding(.bottom, 3)
            
            //quantity & +/- buttons
            HStack(spacing: 12) {
                
                ReductionButton(count: $quantity, product: product)
                
                ZStack{
                    Color.white
                        .frame(width: 20, height: 20)
                        .cornerRadius(6)
                    
                    Text("\(quantity)")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1.0)
                                .frame(width: 20, height: 20)
                                .opacity(0.5)
                        )
                }
                
                IncrementButton(count: $quantity, product: product)
            }
        }
        .frame(width: 110, height: 120)
        .padding(.vertical, 14)
        .background(Color(red: 0.95, green: 0.96, blue: 0.97))
        .cornerRadius(16)
        
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1.0)
                .opacity(0.5)
        )
    }
}


//MARK: - (+/-) Buttons
struct IncrementButton: View {
    //MARK: - Properties
    @Binding var count: Int
    var product: Product
    @EnvironmentObject var cart: CartModel
    
    //MARK: - Body
    var body: some View {
        Button(action: {
            count += 1
            cart.addToCart(product: product)
        }, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .foregroundColor(.appGreen)
                .frame(width: 20, height: 20)
        }
        )
    }
}

struct ReductionButton: View {
    //MARK: - Properties
    @Binding var count: Int
    var product: Product
    @EnvironmentObject var cart: CartModel
    
    
    //MARK: - Body
    var body: some View {
        Button(action: {
            if count > 0 {
                count -= 1
                cart.removeFromCart(product: product)
            }
        }, label: {
            Image(systemName: "minus.circle.fill")
                .resizable()
                .foregroundColor(.appGreen)
                .frame(width: 20, height: 20)
        }
        )
    }
}


//MARK: - Preview
#Preview {
    GroceryShopTabView()
}
