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
  
  private var isValid: Bool {
    if let value = Int(groupSizeStr) {
      return value > 0
    } else {
      return false
    }
  }
  
  var body: some View {
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
  }
}

struct GroupSize_Previews: PreviewProvider {
  static var previews: some View {
    GroupSize(groupSizeStr: .constant(""),
              isGroupSizeValid: .constant(false))
  }
}