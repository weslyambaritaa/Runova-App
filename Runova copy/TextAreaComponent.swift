//
//  TextAreaComponent.swift
//  Runova
//
//  Created by Foundation-026 on 26/06/25.
//

import SwiftUI

struct TextAreaComponent: View {
    @State private var height: String = ""
    @State private var startingWeight: String = ""
    @State private var targetWeight: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("Name")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
            
            TextField("Wesly Ambarita", text: $height)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    TextAreaComponent()
}
