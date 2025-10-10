//
//  PrimaryButtonView.swift
//  BookHome
//
//  Created by Ellinor Elisabeth Helgesen on 30/09/2025.
//

import SwiftUI

struct ReuseableButton: View {
    
    let title: String           
    let backgroundColor: Color
    var width: CGFloat? = nil
    var height: CGFloat = 48
    
    var body: some View {
    
        Button {
            print("\(title) tapped")
        } label: {
            Text(title)
        }
        .foregroundStyle(.white)
        .font(.subheadline)
        .fontWeight(.semibold)
        .frame(
            width: width ?? .infinity,
            height: height
        )
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    } // body
    
} // struct


