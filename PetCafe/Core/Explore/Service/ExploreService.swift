//
//  ExploreService.swift
//  BookHome
//
//  Created by Ellinor Elisabeth Helgesen on 01/10/2025.
//

import Foundation


class ExploreService {
    func fetchListing() async throws -> [Cafe] {
        return DeveloperPreview.shared.listings
    }
}
