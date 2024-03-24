//
//  StartSimulationButton.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct StartSimulationButton: View {
  @Binding var isSizeValid: Bool
  @Binding var isInfectionAmountValid: Bool
  @Binding var isTimeValid: Bool
  
  @Binding var groupSizeStr: String
  @Binding var infectionAmountStr: String
  @Binding var timeStr: String
  
  @State private var status: Bool = false
  
  private var isReadyToStart: Bool {
    isSizeValid && isInfectionAmountValid && isTimeValid
  }
  
  var body: some View {
    NavigationLink(destination: SimulationView(groupSize: Int(groupSizeStr) ?? 0,
                                               infectionAmount: Int(infectionAmountStr) ?? 0,
                                               periodTime: Double(timeStr) ?? 0)) {
      Text("Запустить моделирование")
        .padding()
        .foregroundColor(.black)
        .background(isReadyToStart ? .green : .gray)
        .cornerRadius(10)
    }
    .disabled(!isReadyToStart)
  }
}

struct StartSimulationButton_Previews: PreviewProvider {
    static var previews: some View {
      StartSimulationButton(isSizeValid: .constant(true),
                            isInfectionAmountValid: .constant(true),
                            isTimeValid: .constant(true),
                            groupSizeStr: .constant("5"),
                            infectionAmountStr: .constant("4"),
                            timeStr: .constant("1.5"))
    }
}
