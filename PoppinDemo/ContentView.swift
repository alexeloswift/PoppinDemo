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
    
//    BODY QUICK VIEW
    
    var body: some View {
        NavigationStack {
            VStack {
                pickerView
                partyRow
            }
            .navigationTitle("Parties")
        }
    }
    
//    BODY COMPONENTS
    
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
            VStack {
                ForEach(viewmodel.partyArrayFull) { party in
                    NavigationLink(destination: DetailedView(party: party)) {
                        Text(party.partyName)
                            .modifier(PartyBoxViewMod())
                            .padding(.top, 10)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct DetailedView: View {
    var party: Party
    
    var body: some View {
        NavigationStack {
            Text("")
                .navigationTitle(party.partyName)
        }
    }
}



struct PartyBoxViewMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .padding()
            .frame(width: 340, height: 118, alignment: .topLeading)
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color.purple, lineWidth: 2.5))
    }
}
