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
        addParties()
    }
    
    let partyArray = [
        Party(partyName: "Tony's Soiree", latitude: 01.21, longitude: 78.21),
        Party(partyName: "Alonzo's Football Party", latitude: 01.21, longitude: 78.21),
        Party(partyName: "Lisa's Book Club", latitude: 01.21, longitude: 78.21),
        Party(partyName: "Brad's Rager", latitude: 01.21, longitude: 78.21),
        Party(partyName: "Jack's Yoga Class", latitude: 01.21, longitude: 78.21),
        Party(partyName: "Tim's Fencing Club", latitude: 01.21, longitude: 78.21)
    ]
 
    func addParties() {
        partyArrayFull = partyArray
    }
}
