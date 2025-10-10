//
//  ExploreView.swift
//  BookHome
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                SearchAndFilterBar(location: $viewModel.searchLocation)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            showDestinationSearchView.toggle()
                        }
                    }
                ScrollView {
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.filteredListings) {listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }
                    }
                }
                .navigationDestination(for: Cafe.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarHidden(true) 
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
