//
//  DeveloperPreview.swift
//  DyreKafe
//
//  Created by Ellinor Elisabeth Helgesen on 01/10/2025.
//

import Foundation

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    
    var listings: [Cafe] = [
        
        .init(
            id: UUID().uuidString,
            ownerUserId: UUID().uuidString,
            ownerName: "Mari Berg",
            ownerImageUrl: "p1",
            numberOfPets: 8,
            numberOfPetsForAdoption: 2,
            numberOfGuests: 12,
            pricePerPerson: 249,
            latitude: 59.92384,
            longitude: 10.76397,
            imageURLs: ["c1", "c2", "c3", "c4"],
            address: "Helgesensgate 1",
            city: "Oslo",
            state: "Oslo",
            title: "Meow & Brew Café",
            rating: 4.9,
            feature: [.animalFriendlyStaff, .organicTreats, .calmEnvironment, .donationSupported],
            amenities: [.wifi, .petSnacks, .catRoom, .quietArea, .coffeeBar],
            type: .catCafe,
            petsForAdoption: [
                .init(
                    id: UUID().uuidString,
                    name: "Luna",
                    imageUrl: "cat1",
                    age: 2,
                    breed: "Siamese",
                    description: "Playful and affectionate."
                ),
                .init(
                    id: UUID().uuidString,
                    name: "Milo",
                    imageUrl: "cat2",
                    age: 3,
                    breed: "House Cat",
                    description: "Loves naps and head scratches."
                )
            ]
        ),
        
        .init(
            id: UUID().uuidString,
            ownerUserId: UUID().uuidString,
            ownerName: "Trygve Nilsen",
            ownerImageUrl: "p2",
            numberOfPets: 13,
            numberOfPetsForAdoption: 3,
            numberOfGuests: 20,
            pricePerPerson: 269,
            latitude: 59.74766,
            longitude: 10.18267,
            imageURLs: ["d1", "d2", "d3", "d4"],
            address: "Øvre Storgata 4",
            city: "Drammen",
            state: "Buskerud",
            title: "Woof & Bean",
            rating: 4.8,
            feature: [.animalFriendlyStaff, .petPlayZone, .vetOnCall],
            amenities: [.wifi, .dogLounge, .petSnacks, .toys, .outdoorArea],
            type: .dogCafe,
            petsForAdoption: [
                .init(
                    id: UUID().uuidString,
                    name: "King",
                    imageUrl: "dog1",
                    age: 4,
                    breed: "Pug",
                    description: "Loyal and calm, loves walks."
                ),
                .init(
                    id: UUID().uuidString,
                    name: "Bella",
                    imageUrl: "dog2",
                    age: 2,
                    breed: "Labrador",
                    description: "Energetic and friendly."
                ),
                .init(
                    id: UUID().uuidString,
                    name: "Max",
                    imageUrl: "dog3",
                    age: 5,
                    breed: "Beagle",
                    description: "Loves treats and cuddles."
                )
            ]
        ),
        
        .init(
            id: UUID().uuidString,
            ownerUserId: UUID().uuidString,
            ownerName: "Helene Olsen",
            ownerImageUrl: "p3",
            numberOfPets: 15,
            numberOfPetsForAdoption: 2,
            numberOfGuests: 25,
            pricePerPerson: 239,
            latitude: 60.392848,
            longitude: 5.334055,
            imageURLs: ["m1", "m2", "m3", "m4"],
            address: "Cappers vei 1",
            city: "Bergen",
            state: "Vestland",
            title: "Fur & Friends Café",
            rating: 4.7,
            feature: [.adoptionCorner, .organicTreats, .donationSupported],
            amenities: [.wifi, .petSnacks, .coffeeBar, .outdoorArea, .toys],
            type: .mixedAnimals,
            petsForAdoption: [
                .init(
                    id: UUID().uuidString,
                    name: "Grace",
                    imageUrl: "rabbit1",
                    age: 1,
                    breed: "Unknown",
                    description: "Sweet and gentle, loves carrots."
                ),
                .init(
                    id: UUID().uuidString,
                    name: "Shadow",
                    imageUrl: "cat4",
                    age: 2,
                    breed: "House Cat",
                    description: "Curious and cuddly."
                )
            ]
        ),
        
        .init(
            id: UUID().uuidString,
            ownerUserId: UUID().uuidString,
            ownerName: "Even Johansen",
            ownerImageUrl: "p4",
            numberOfPets: 12,
            numberOfPetsForAdoption: 4,
            numberOfGuests: 18,
            pricePerPerson: 279,
            latitude: 59.919871,
            longitude: 10.757343,
            imageURLs: ["c5", "c6", "c7", "c8"],
            address: "Markveien 55",
            city: "Oslo",
            state: "Oslo",
            title: "Cat Latté",
            rating: 4.5,
            feature: [.animalFriendlyStaff, .vetOnCall, .calmEnvironment],
            amenities: [.wifi, .coffeeBar, .quietArea, .outdoorArea],
            type: .catCafe,
            petsForAdoption: [
                .init(
                    id: UUID().uuidString,
                    name: "Misty",
                    imageUrl: "cat5",
                    age: 3,
                    breed: "Tabby",
                    description: "Gentle and loves to nap."
                ),
                .init(
                    id: UUID().uuidString,
                    name: "Leo",
                    imageUrl: "cat6",
                    age: 1,
                    breed: "Tabby",
                    description: "Playful and curious."
                ),
                .init(
                    id: UUID().uuidString,
                    name: "Kiki",
                    imageUrl: "cat7",
                    age: 1,
                    breed: "Norwegain Forest",
                    description: "Playful and love to eat."
                ),
                .init(
                    id: UUID().uuidString,
                    name: "Simba",
                    imageUrl: "cat8",
                    age: 4,
                    breed: "Main Coon",
                    description: "Shy but loves to cuddle."
                )
            ]
        )
    ]
}
