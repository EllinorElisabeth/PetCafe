//
//  Listing.swift
//  BookHome
//
//  Created by Ellinor Elisabeth Helgesen on 01/10/2025.
//

import Foundation

struct Cafe: Identifiable, Codable, Hashable {
    // For ListingDetailView
    let id: String
    let ownerUserId: String
    let ownerName: String
    let ownerImageUrl: String
    
    let numberOfPets: Int
    let numberOfPetsForAdoption: Int
    let numberOfGuests: Int
    
    var pricePerPerson: Int
    
    let latitude: Double
    let longitude: Double
    
    var imageURLs: [String]
    
    let address: String
    let city: String
    let state: String
    
    let title: String
    var rating: Double
    
    var feature: [cafeFeatures]
    var amenities: [CafeAmenity]
    
    let type: CafeType
    
    var petsForAdoption: [PetForAdoption]
}

// Adoption
struct PetForAdoption: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let imageUrl: String
    let age: Int
    let breed: String
    let description: String
}

// Costumes (ikonene)
enum cafeFeatures: Int, Codable, Identifiable, Hashable {
    case animalFriendlyStaff
    case adoptionCorner
    case petPlayZone
    case organicTreats
    case calmEnvironment
    case vetOnCall
    case donationSupported
    
    var id: Int { rawValue }
    
    var imageName: String {
        switch self {
        case .animalFriendlyStaff: return "pawprint.circle"
        case .adoptionCorner: return "heart.text.square"
        case .petPlayZone: return "dog"
        case .organicTreats: return "leaf.circle"
        case .calmEnvironment: return "wind"
        case .vetOnCall: return "stethoscope"
        case .donationSupported: return "hands.sparkles"
        }
    }
    
    var title: String {
        switch self {
        case .animalFriendlyStaff: return "Animal-Friendly Staff"
        case .adoptionCorner: return "Adoption Corner"
        case .petPlayZone: return "Pet Play Zone"
        case .organicTreats: return "Organic Treats"
        case .calmEnvironment: return "Calm Environment"
        case .vetOnCall: return "Vet On Call"
        case .donationSupported: return "Donation Supported"
        }
    }
    
    var subtitle: String {
        switch self {
        case .animalFriendlyStaff:
            return "Our staff is trained in animal welfare and pet handling."
        case .adoptionCorner:
            return "Partnered with shelters to help pets find new homes."
        case .petPlayZone:
            return "Safe and supervised play area for animals."
        case .organicTreats:
            return "Healthy, eco-friendly snacks for pets."
        case .calmEnvironment:
            return "Peaceful space designed for both animals and humans."
        case .vetOnCall:
            return "Veterinary assistance available on request."
        case .donationSupported:
            return "Part of your visit supports local shelters."
        }
    }
}


// Amenities (what hotel offers)
enum CafeAmenity: Int, Codable, Identifiable, Hashable {
    case wifi
    case petSnacks
    case catRoom
    case dogLounge
    case quietArea
    case toys
    case coffeeBar
    case outdoorArea
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .wifi: return "Free Wi-Fi"
        case .petSnacks: return "Pet Snacks"
        case .catRoom: return "Cat Room"
        case .dogLounge: return "Dog Lounge"
        case .quietArea: return "Quiet Area"
        case .toys: return "Toys & Play Items"
        case .coffeeBar: return "Coffee Bar"
        case .outdoorArea: return "Outdoor Area"
        }
    }
    
    var imageName: String {
        switch self {
        case .wifi: return "wifi"
        case .petSnacks: return "leaf"
        case .catRoom: return "pawprint.fill"
        case .dogLounge: return "dog"
        case .quietArea: return "wind"
        case .toys: return "tennisball"
        case .coffeeBar: return "cup.and.saucer"
        case .outdoorArea: return "sun.max"
        }
    }
}


enum CafeType: Int, Codable, Identifiable, Hashable {
    case catCafe
    case dogCafe
    case mixedAnimals
    
    var id: Int { rawValue }
    
    var description: String {
        switch self {
        case .catCafe: return "Cat Café"
        case .dogCafe: return "Dog Café"
        case .mixedAnimals: return "Cat & Dog Café"
        }
    }
}


/*
 
 REQUIRED: Identifiable-protokollen krever unike id.
 Bruker 'rawValue' som ID fordi hver case får automatisk et unik ID.
 Med unike ID-er kan SwiftUI enklere holde styr på hvert element i lister (ForEach).
 
 */
