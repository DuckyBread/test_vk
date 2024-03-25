//
//  GroupSize.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct GroupSize: View {
  @Binding var groupSizeStr: String
  @Binding var isGroupSizeValid: Bool
  let errorMessage: String
  
  private var isValid: Bool {
    if let value = Int(groupSizeStr) {
      return value > 0
    } else {
      return false
    }
  }
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        TextField("Введите размер группы", text: $groupSizeStr)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.numberPad)
        
        switch isValid {
        case true:
          Image(systemName: "checkmark.circle")
            .foregroundColor(.green)
        default:
          Image(systemName: "xmark.circle.fill")
            .foregroundColor(.red)
        }
        
        Spacer()
      }.onChange(of: groupSizeStr) { newValue in
        isGroupSizeValid = isValid
      }
      Text(isGroupSizeValid ? "" : errorMessage)
        .font(.caption)
        .padding(.bottom, 30)
        .foregroundColor(isGroupSizeValid ? .green : .red)
    }
  }
}

struct GroupSize_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      GroupSize(groupSizeStr: .constant(""),
                isGroupSizeValid: .constant(false),
                errorMessage: "Error message")
      Spacer()
    }
  }
}
