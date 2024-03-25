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
  let errorMessage: String

  private var isValid: Bool {
    if let value = Double(periodStr) {
      return value > 0
    } else {
      return false
    }
  }
  
  var body: some View {
    VStack {
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
      Text(isPeriodValid ? "" : errorMessage)
        .font(.caption)
        .padding(.bottom, 30)
        .foregroundColor(isPeriodValid ? .green : .red)
    }
  }
}

struct Period_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Period(periodStr: .constant(""),
             isPeriodValid: .constant(false),
             errorMessage: "Error message")
      Spacer()
    }
  }
}
