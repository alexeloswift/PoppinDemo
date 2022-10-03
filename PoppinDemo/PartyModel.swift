//
//  PartyModel.swift
//  PoppinDemo
//
//  Created by Alexis Diaz on 9/30/22.
//

import Foundation

struct Party: Identifiable {
    var id = UUID()
    var partyName: String
    var latitude: Double
    var longitude: Double
}
