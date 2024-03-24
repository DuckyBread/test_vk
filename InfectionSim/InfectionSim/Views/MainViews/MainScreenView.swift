//
//  MainScreenView.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct MainScreenView: View {
    @State private var groupSizeStr: String = ""
    @State private var infectionFactorStr: String = ""
    @State private var periodStr: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                TextField("Введите размер группы", text: $groupSizeStr)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Image(systemName: "checkmark.circle")
                Spacer()
            }
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
