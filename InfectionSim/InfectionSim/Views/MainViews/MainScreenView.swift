//
//  MainScreenView.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct MainScreenView: View {
  @EnvironmentObject var groupList: PersonList
  
  @State private var groupSizeStr: String = ""
  @State private var isGroupSizeValid: Bool = false
  
  @State private var infectionFactorStr: String = ""
  @State private var isInfectionFactorValid = false
  
  @State private var periodStr: String = ""
  @State private var isPeriod: Bool = false
   
  var body: some View {
    NavigationStack {
      VStack {
        GroupSize(groupSizeStr: $groupSizeStr,
                  isGroupSizeValid: $isGroupSizeValid,
                  errorMessage: "Введите целочисленное значение")
        
        InfectionFactor(infectionFactorStr: $infectionFactorStr,
                        isInfectionFactorValid: $isInfectionFactorValid,
                        errorMessage: "Введите целочисленное значение")

        Period(periodStr: $periodStr,
               isPeriodValid: $isPeriod,
               errorMessage: "Некорректное значение")
        
        StartSimulationButton(isSizeValid: $isGroupSizeValid,
                              isInfectionAmountValid: $isInfectionFactorValid,
                              isTimeValid: $isPeriod,
                              groupSizeStr: $groupSizeStr,
                              infectionAmountStr: $infectionFactorStr,
                              timeStr: $periodStr)
      }
    }
  }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
      MainScreenView()
        .environmentObject(PersonList())
    }
}
