//
//  PartyViewModel.swift
//  PoppinDemo
//
//  Created by Alexis Diaz on 9/30/22.
//

import Foundation

class PartyViewModel: ObservableObject {
    
    @Published var partyArrayFull: [Party] = []
    
    init() {
        fetchParties()
    }
    
    let partyArray = [
        Party(partyName: "Tony's Soiree", latitude: 33.44, longitude: -94.04),
        Party(partyName: "Alonzo's Football Party", latitude: 33.540, longitude: -112.070),
        Party(partyName: "Lisa's Book Club", latitude: 41.840, longitude: -87.680),
        Party(partyName: "Brad's Rager", latitude: 29.770, longitude: -95.390),
        Party(partyName: "Jack's Yoga Class", latitude: 41.840, longitude: -87.680),
        Party(partyName: "Tim's Fencing Club", latitude: 33.540, longitude: -112.070)
    ]
 
    func fetchParties() {
        partyArrayFull = partyArray
    }
}

