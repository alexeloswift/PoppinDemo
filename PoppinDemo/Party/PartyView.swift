//
//  PartyView.swift
//  PoppinDemo
//
//  Created by Alexis Diaz on 10/4/22.
//

import SwiftUI

struct PartyView: View {
    @StateObject private var viewmodel = PartyViewModel()
    @State var listArray = ["This Week", "Popular", "Nearby"]
    
    //    MARK: - BODY QUICK VIEW
    
    var body: some View {
        
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    pickerView
                    partyRow
                }
                .navigationTitle("Parties")
                .frame(width: geo.size.width)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    //    MARK: - BODY COMPOSITION
    
    private var pickerView: some View {
        Picker("", selection: $listArray) {
            ForEach(listArray, id: \.self) { name in
                Text(name)
            }
        }
        .pickerStyle(.segmented)
    }
    
    private var partyRow: some View {
        ScrollView {
            VStack(spacing: 18) {
                ForEach(viewmodel.partyArrayFull) { party in
                    NavigationLink(destination: DetailedView(viewmodel: DetailedViewModel(party: party))) {
                        Text(party.partyName)
                            .modifier(PartyBoxViewMod())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}


struct PartyView_Previews: PreviewProvider {
    static var previews: some View {
        PartyView()
    }
}

// MARK: - VIEW MODIFIERS FOR PARTIES

struct PartyBoxViewMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .padding()
            .frame(width: 360, height: 160, alignment: .topLeading)
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color.purple, lineWidth: 2.5))
            .background(
                .regularMaterial,
                in: RoundedRectangle(cornerRadius: 9, style: .continuous))
    }
}
