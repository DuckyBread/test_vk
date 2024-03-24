//
//  Person.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import Foundation
import SwiftUI

struct Person: Identifiable {
  let id = UUID()
  var isInfected: Bool = false
}

class PersonList: ObservableObject {
  @Published var persons: [Person] = [Person]()
}
