//
//  SimulationView.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct SimulationView: View {
  @EnvironmentObject private var groupList: PersonList
  let infectionAmount: Int
  let periodTime: Double
  
  private var infectedCounter: String {
    String(groupList.persons.filter { $0.isInfected }.count)
  }

  private var healthyCounter: String {
    String(groupList.persons.filter { !$0.isInfected }.count)
  }
  
  var body: some View {
    NavigationView {
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
      }.toolbar {
        ToolbarItem(placement: .bottomBar) {
          ToolBarStatus(healthyCounter: healthyCounter,
                        infectedCounter: infectedCounter)
        }
      }
    }
  }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
      SimulationView(infectionAmount: 5, periodTime: 2.5)
        .environmentObject(PersonList())
    }
}
