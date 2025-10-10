//
//  ListingImageCarousel.swift
//  BookHome
//
//  Created by Ellinor Elisabeth Helgesen on 30/09/2025.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    let listing: Cafe
    
    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
