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
                .badge(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
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
        List(cart.items) { item in
            HStack {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                
                Spacer()
                    .frame(width: 10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.headline)
                        .bold()
                    //
                    Text("\(item.price)")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                }
                
                Spacer()
                
                Text("\(item.quantity)")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.72))
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            
            Divider()
        }
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
    
    private var formattedPrice: String {
        return String(format: "%.2f", floor(product.price * 100) / 100)
    }
    
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
                
                Text("\(formattedPrice)$ (kg)")
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
