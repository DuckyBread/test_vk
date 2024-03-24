//
//  MainScreenView.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct MainScreenView: View {
  @State private var groupSizeStr: String = ""
  @State private var isGroupSizeValid: Bool = false
  
  @State private var infectionFactorStr: String = ""
  @State private var isInfectionFactorValid = false
  
  @State private var periodStr: String = ""
  @State private var isPeriod: Bool = false
  
  var body: some View {
    VStack {
      GroupSize(groupSizeStr: $groupSizeStr, isGroupSizeValid: $isGroupSizeValid)
      
      Text(isGroupSizeValid ? "Group size is valid" : "Incorrect group size")
    }
  }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
