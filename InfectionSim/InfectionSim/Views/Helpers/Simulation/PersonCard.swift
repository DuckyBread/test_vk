//
//  PersonCard.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct PersonCard: View {
  @Binding var person: Person
  
  var body: some View {
    VStack(alignment: .center) {
      image
      info
    }
    .background()
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .padding()
  }
  
  private var image: some View {
    Image(person.isInfected ? "illness" : "healthy")
      .resizable()
      .aspectRatio(contentMode: .fit)
  }
  
  private var info: some View {
    VStack(alignment: .leading) {
      Text("ID: \(String(person.id.uuidString.prefix(8)))")
        .foregroundColor(.primary)
      
      HStack {
        Text("Is infected: ")
          .foregroundColor(.primary)
        Text(person.isInfected ? "YES" : "NO")
          .foregroundColor(person.isInfected ? .red : .green)
      }
    }
  }
}

struct PersonCard_Previews: PreviewProvider {
  static var previews: some View {
    PersonCard(person: .constant(Person(isInfected: true)))
  }
}
