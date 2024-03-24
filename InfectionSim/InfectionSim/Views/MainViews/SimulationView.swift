//
//  SimulationView.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct SimulationView: View {
  let groupSize: Int
  let infectionAmount: Int
  let periodTime: Double
  
  @ObservedObject private var groupList = PersonList()
  
  init(groupSize: Int, infectionAmount: Int, periodTime: Double) {
    self.groupSize = groupSize
    self.infectionAmount = infectionAmount
    self.periodTime = periodTime
    
    if !groupList.persons.isEmpty {
      groupList.persons = []
    }
    
    for _ in 0..<groupSize {
      groupList.persons.append(Person())
    }
  }
  
  var body: some View {
    ScrollView {
      VStack {
        ForEach(0..<groupList.persons.count) { index in
          PersonCard(person: $groupList.persons[index])
            .shadow(radius: 10)
            .padding()
            .onTapGesture {
              if !groupList.persons[index].isInfected {
                groupList.persons[index].isInfected.toggle()
              }
            }
        }
      }
    }
  }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
      SimulationView(groupSize: 10, infectionAmount: 5, periodTime: 2.5)
    }
}
