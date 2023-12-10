//
//  ContentView.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 10.12.23.
//

import SwiftUI

struct GroceryShop: View {
    //MARK: State Properties
    @State private var vegetables = ProductList.Vegetables
    @State private var fruits = ProductList.Fruits
    @State private var meat = ProductList.Meat
    @State private var seafood = ProductList.Seafood
    
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
            //            .padding(.vertical, 0)
            
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
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.blue)
            
            Image(systemName: "arrow.forward")
                .foregroundColor(.blue)
                .padding(.trailing, 20)
        }
        
        CustomDivider()
        
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
    //MARK: - Binding Properties
    @Binding var product: Product
    
    //MARK: - State Properties
    @State private var quantity = 0
    
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
                
                Text("\(product.price)$ (kg)")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }.padding(.bottom, 3)
            
            //plus / minus buttons & product quantity
            HStack(spacing: 12) {
                
                ReductionButton(count: $quantity)
                
                //quantity & +/- buttons
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
                
                IncrementButton(count: $quantity)
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
    
    //MARK: - Body
    var body: some View {
        Button(action: {
            count += 1
        }, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .foregroundColor(Color(red: 0.14, green: 0.67, blue: 0.29))
                .frame(width: 20, height: 20)
        }
        )
    }
}

struct ReductionButton: View {
    //MARK: - Properties
    @Binding var count: Int
    
    //MARK: - Body
    var body: some View {
        Button(action: {
            if count > 0 {
                count -= 1
            }
        }, label: {
            Image(systemName: "minus.circle.fill")
                .resizable()
                .foregroundColor(Color(red: 0.14, green: 0.67, blue: 0.29))
                .frame(width: 20, height: 20)
        }
        )
    }
}


//MARK: - Custom Divider
struct CustomDivider: View {
    
    //MARK: - Body
    var body: some View {
        VStack {
            Divider()
                .background(Color.gray)
                .frame(height: 1)
                .opacity(0.5)
                .padding(.leading, 150)
        }
    }
}

//MARK: - Preview
#Preview {
    GroceryShop()
}
