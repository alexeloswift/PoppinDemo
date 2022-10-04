//
//  ContentView.swift
//  PoppinDemo
//
//  Created by Alexis Diaz on 9/30/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewmodel = PartyViewModel()
    @State var listArray = ["This Week", "Popular", "Nearby"]
    
    // BODY QUICK VIEW
    
    var body: some View {
        NavigationStack {
            VStack {
                pickerView
                partyRow
            }
            .navigationTitle("Parties")
            
        }
    }
    
    // BODY COMPONENTS
    
    private var pickerView: some View {
        Picker("", selection: $listArray) {
            ForEach(listArray, id: \.self) { name in
                Text(name)
            }
        }
        .pickerStyle(.segmented)
    }
    
    private var partyRow: some View {
        GeometryReader { geo in

        ScrollView {
                VStack {
                    ForEach(viewmodel.partyArrayFull) { party in
                        NavigationLink(destination: DetailedView(viewmodel: DetailedViewModel(party: party))) {
                            Text(party.partyName)
                                .modifier(PartyBoxViewMod())
                                .padding(.top, 8)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
                .frame(width: geo.size.width, alignment: .center)
                
            }}
        .scrollIndicators(.hidden)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// VIEW MOD FOR PARTIES

struct PartyBoxViewMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .padding()
            .frame(width: 360, height: 160, alignment: .topLeading)
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color.purple, lineWidth: 2.5))
    }
}
