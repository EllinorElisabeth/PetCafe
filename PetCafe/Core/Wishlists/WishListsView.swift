//
//  WishListsView.swift
//  BookHome
//
//  Created by Ellinor Elisabeth Helgesen on 30/09/2025.
//

import SwiftUI

struct WishListsView: View {
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                // Log in to view whishlists txt...
                VStack(alignment: .leading, spacing: 8) {
                    Text("Wishlists")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    
                    Text("Create, view, or edit your wishlists once you've logged in")
                        .font(.footnote)
                } // Log in to view whishlists txt - V
                
                ReuseableButton(
                    title: "Log in",
                    backgroundColor: .brown,
                    width: 360
                )
                
            } // V
            .padding()
            
        } // Nav...Stack
    } // body
} // WishListsView


#Preview {
    WishListsView()
}
