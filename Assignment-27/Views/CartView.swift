//
//  CartView.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 12.12.23.
//

import SwiftUI

struct CartView: View {
    //MARK: - Properties
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var isDiscountApplied = false
    @State private var isVoucherDepleted = false
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(cartViewModel.items) { item in
                    CartItemRowView(item: item)
                }
                
                HStack {
                    Text("Total Price:")
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                    Text("\(cartViewModel.totalPrice)$")
                        .font(.system(size: 20))
                        .bold()
                }
                
                Image("discountVoucher")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        if !isDiscountApplied {
                            isDiscountApplied = true
                            cartViewModel.applyDiscount()
                        } else {
                            isVoucherDepleted = true
                        }
                    }
                
                if isVoucherDepleted {
                    HStack {
                        Spacer()
                        
                        Text("Your voucher has been depleted")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.red)
                        
                        Spacer()
                    }
                } else if isDiscountApplied {
                    HStack {
                        Text("Discounted Price:")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.red)
                        
                        Spacer()
                        
                        Text(String(format: "%.2f$", cartViewModel.discountedTotal))
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.red)
                    }
                }
            }
            
            
        }
        .navigationBarTitle("My Cart", displayMode: .inline)
    }
}

struct CartItemRowView: View {
    //MARK: - Properties
    let item: Product
    @EnvironmentObject var cartViewModel: CartViewModel
    
    //MARK: - Body
    var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .padding(.trailing, 3)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.system(size: 20))
                    .bold()
                    .lineLimit(1)
                
                Text("1 kg price x \(item.quantity) Qty")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
            }
            .frame(width: 150)
            .padding(.trailing, 8)
            
            Button(action: {
                cartViewModel.removeAllFromCart(product: item)
            }) {
                Image(systemName: "trash.fill")
                    .resizable()
                    .foregroundColor(.red).opacity(0.8)
                    .frame(width: 20, height: 20)
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
        .padding(.vertical, 8)
    }
}

//MARK: - Preview
#Preview {
    CartView().environmentObject(CartViewModel())
}
