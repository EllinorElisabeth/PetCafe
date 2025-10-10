//
//  ExploreViewModel.swift
//  BookHome
//
//  Created by Ellinor Elisabeth Helgesen on 01/10/2025.
//

import Foundation
import Combine

class ExploreViewModel: ObservableObject {
    @Published var listings = [Cafe]()
    @Published var filteredListings = [Cafe]()
    @Published var searchLocation = ""
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        Task { await fetchListing() }
    }
    
    func fetchListing() async {
        do {
            self.listings = try await service.fetchListing()    // Hent data fra server
            self.filteredListings = listings                    // Viser alt i starten
        } catch {
            print("Error: Failed to fetch listings: \(error.localizedDescription)")
        }
    }
    
    func updateListingForLocation () {
        if searchLocation.isEmpty {
            filteredListings = listings
            return
        }
        
        filteredListings = listings.filter { listing in
            listing.city.lowercased() == searchLocation.lowercased() ||
            listing.state.lowercased() == searchLocation.lowercased()
        }
    }
}
