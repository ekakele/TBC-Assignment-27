//
//  ContentView.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 10.12.23.
//

import SwiftUI

struct GroceryShop: View {
    //MARK: Properties
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 6) {
                        
                        Image("banner")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                        
                        //products
                        VStack(alignment: .leading, spacing: 4) {
                            //section title
                            Text("Vegetables")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.black)
                            
                            CustomDivider()
                            
                            
                            ProductCell()
                            
                            //section title
                            Text("Fruits")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.black)
                            
                            CustomDivider()
                            
                            ProductCell()
                            
                            //section title
                            Text("Meat")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.black)
                            
                            CustomDivider()
                            
                            
                            ProductCell()
                            
                            //section title
                            Text("Seafood")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.black)
                            
                            CustomDivider()
                            
                            ProductCell()

                        }
                    }
                    .padding(.horizontal, 12)
                    .navigationBarTitle("Shop Grocery Online", displayMode: .inline)
                }
            }
            //            .padding(.vertical, 0)
            
        }
    }
}

//MARK: - Product
struct ProductCell: View {
    var body: some View {
        VStack {
            
            Image("banana")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 60)
            
            //title & price stack
            VStack(spacing: 2) {
                Text("Broccoli")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.black)
                
                Text("$2.99 (kg)")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }.padding(.bottom, 3)
            
            //plus / minus buttons & product quantity
            HStack(spacing: 12) {
                Button(action: {
                    print("pressed")
                }, label: {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .foregroundColor(Color(red: 0.14, green: 0.67, blue: 0.29))
                        .frame(width: 20, height: 20)
                }
                )
                
                
                //quantity & +/- buttons
                ZStack{
                    Color.white
                        .frame(width: 20, height: 20)
                        .cornerRadius(6)
                    
                    Text("1")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1.0)
                                .frame(width: 20, height: 20)
                                .opacity(0.5)
                        )
                }
                
                
                Button(action: {
                    print("pressed")
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color(red: 0.14, green: 0.67, blue: 0.29))
                        .frame(width: 20, height: 20)
                }
                )
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

//MARK: - Custom Divider
struct CustomDivider: View {
    var body: some View {
        VStack {
            Divider()
                .background(Color.gray)
                .frame(height: 2)
                .opacity(0.5)
                .padding(.leading, 150)
        }
    }
}
//MARK: - Preview
#Preview {
    GroceryShop()
}
