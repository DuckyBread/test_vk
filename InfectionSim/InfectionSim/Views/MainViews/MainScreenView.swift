//
//  MainScreenView.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct InputField: View {
  var message: String
  var isValid: Bool
  
  var body: some View {
    Text(isValid ? "" : message)
      .font(.caption)
      .padding(.bottom, 30)
      .foregroundColor(isValid ? .green : .red)
  }
}

struct MainScreenView: View {
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
                  isGroupSizeValid: $isGroupSizeValid)
        InputField(message: "Введите целочисленное значение",
                   isValid: isGroupSizeValid)
        
        InfectionFactor(infectionFactorStr: $infectionFactorStr,
                        isInfectionFactorValid: $isInfectionFactorValid)
        InputField(message: "Введите целочисленное значение",
                   isValid: isInfectionFactorValid)

        Period(periodStr: $periodStr,
               isPeriodValid: $isPeriod)
        InputField(message: "Некорректное значение",
                   isValid: isPeriod)
        
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
    }
}
