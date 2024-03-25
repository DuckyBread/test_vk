//
//  ContentView.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct ContentView: View {
  @StateObject var groupList = PersonList()
  
  var body: some View {
      MainScreenView()
      .environmentObject(groupList)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
