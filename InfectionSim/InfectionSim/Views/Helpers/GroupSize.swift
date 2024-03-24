//
//  GroupSize.swift
//  InfectionSim
//
//  Created by Silvia Julieann on 3/24/24.
//

import SwiftUI

struct GroupSize: View {
    @State private var groupSizeStr: String = ""
    
    private var isValid: Bool {
        Int(groupSizeStr) != nil
    }
    
    var body: some View {
        HStack {
            Spacer()
            TextField("Введите размер группы", text: $groupSizeStr)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if isValid {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
            }
            Spacer()
        }
    }
}

struct GroupSize_Previews: PreviewProvider {
    static var previews: some View {
        GroupSize()
    }
}
