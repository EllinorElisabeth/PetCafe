//
//  ListingItemView.swift
//  BookHome
//
//

import SwiftUI

struct ListingItemView: View {
    let listing: Cafe
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // listing details
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("\(listing.title)")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("\(listing.address), \(listing.city)")
                        .fontWeight(.semibold)
                    
                    Text("No-show fee: \(listing.pricePerPerson) kr per person")
                        .foregroundStyle(.gray)
                    
                }
                .foregroundStyle(.black)
                
                Spacer()
                // ratings
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text(String(format: "%.1f", listing.rating))
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
