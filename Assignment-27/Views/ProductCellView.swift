//
//  ProductCellView.swift
//  Assignment-27
//
//  Created by Eka Kelenjeridze on 12.12.23.
//

import SwiftUI

struct ProductCellView: View {
    //MARK: - Properties
    @StateObject var productCellViewModel: ProductCellViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            Image("\(productCellViewModel.product.image)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 60)
            
            VStack(spacing: 2) {
                Text("\(productCellViewModel.product.title)")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.black)
                
                Text("\(productCellViewModel.product.formattedPrice)$ (kg)")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }.padding(.bottom, 3)
            
            HStack(spacing: 12) {
                ReductionButtonView(viewModel: productCellViewModel)
                
                ZStack{
                    Color.white
                        .frame(width: 20, height: 20)
                        .cornerRadius(6)
                    
                    Text("\(productCellViewModel.getQuantity())")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1.0)
                                .frame(width: 20, height: 20)
                                .opacity(0.5)
                        )
                }
                
                IncrementButtonView(viewModel: productCellViewModel)
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

struct IncrementButtonView: View {
    //MARK: - Properties
    @ObservedObject var viewModel: ProductCellViewModel
    
    //MARK: - Body
    var body: some View {
        Button(action: viewModel.incrementQuantity, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .foregroundColor(.appGreen)
                .frame(width: 20, height: 20)
        }
        )
    }
}

struct ReductionButtonView: View {
    //MARK: - Properties
    @ObservedObject var viewModel: ProductCellViewModel
    
    //MARK: - Body
    var body: some View {
        Button(action: viewModel.decrementQuantity, label: {
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
    ProductCellView(
        productCellViewModel: ProductCellViewModel(
            product: Product(
                image: "banana",
                title: "Banana",
                price: 3.99
            ),
            cartViewModel: CartViewModel()
        )
    )
    .environmentObject(CartViewModel())
}
