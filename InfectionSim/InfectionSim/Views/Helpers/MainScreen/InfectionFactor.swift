//
//  InfectionFactor.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct InfectionFactor: View {
  @Binding var infectionFactorStr: String
  @Binding var isInfectionFactorValid: Bool
  
  private var isValid: Bool {
    if let value = Int(infectionFactorStr) {
      return value > 0
    } else {
      return false
    }
  }
  
  var body: some View {
    HStack {
      Spacer()
      TextField("Заражение при контакте", text: $infectionFactorStr)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.decimalPad)
      
      switch isValid {
      case true:
        Image(systemName: "checkmark.circle")
          .foregroundColor(.green)
      default:
        Image(systemName: "xmark.circle.fill")
          .foregroundColor(.red)
      }
      
      Spacer()
    }.onChange(of: infectionFactorStr) { newValue in
      isInfectionFactorValid = isValid
    }
  }
}

struct InfectionFactor_Previews: PreviewProvider {
  static var previews: some View {
    InfectionFactor(infectionFactorStr: .constant(""),
                    isInfectionFactorValid: .constant(false))
  }
}
