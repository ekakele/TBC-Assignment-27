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
        ZStack {
            Color(red: 0.95, green: 0.96, blue: 0.97)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            NavigationView {
                
                VStack(alignment: .leading) {
                    
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .padding(20)
                    
                    ProductCell()
                }
                .navigationBarTitle("Grocery Shop", displayMode: .inline)
            }
        }
    }
}

//MARK: - Product
struct ProductCell: View {
    //MARK: Properties
    
    var body: some View {
        VStack {
            
            Image("broccoli")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            Spacer()
                        
            //info & add button stack
            HStack(spacing: 25) {
                //title & price stack
                VStack(spacing: 8) {
                    Text("Broccoli")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.black)
                    
                    Text("$2.99 (kg)")
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.black)
                }
                                
                Button(action: {
                    print("pressed")
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color(red: 0.14, green: 0.67, blue: 0.29))
                        .frame(width: 36, height: 36)
                }
                        
                )
            }

            Spacer()
        }
        .frame(width: 160, height: 180)
        .background(Color(red: 0.95, green: 0.96, blue: 0.97))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1.0)
                .opacity(0.5)
    )
        
        
    }
}
//MARK: - Preview
#Preview {
    GroceryShop()
}
