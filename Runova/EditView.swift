//
//  EditView.swift
//  Runova
//
//  Created by Foundation-026 on 02/07/25.
//

import SwiftUI

struct EditView: View {
    var userData: UserData
    
    var body: some View {
        
        VStack{
            Text(userData.name)
        }
    }
}

#Preview {
    EditView(userData: UserData())
}
