//
//  ToolBarStatus.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/25/24.
//

import SwiftUI

struct ToolBarStatus: View {
  var healthyCounter: String
  var infectedCounter: String
  
  var body: some View {
    HStack {
      Image("healthy")
        .resizable()
        .frame(width: 40, height: 40)
      Text(healthyCounter)
        .foregroundColor(.green)
      
      Image("illness")
        .resizable()
        .frame(width: 40, height: 40)
      Text(infectedCounter)
        .foregroundColor(.red)
    }
  }
}

struct ToolBarStatus_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ToolBarStatus(healthyCounter: "3",
                    infectedCounter: "2")
      Spacer()
    }
  }
}
