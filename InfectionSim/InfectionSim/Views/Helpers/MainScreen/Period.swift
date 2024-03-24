//
//  Period.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct Period: View {
  @Binding var periodStr: String
  @Binding var isPeriodValid: Bool

  private var isValid: Bool {
    if let value = Double(periodStr) {
      return value > 0
    } else {
      return false
    }
  }
  
  var body: some View {
    HStack {
      Spacer()
      TextField("Период перерасчета, секунды", text: $periodStr)
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
    }.onChange(of: periodStr) { newValue in
      isPeriodValid = isValid
    }
  }
}

struct Period_Previews: PreviewProvider {
  static var previews: some View {
    Period(periodStr: .constant(""),
           isPeriodValid: .constant(false))
  }
}
