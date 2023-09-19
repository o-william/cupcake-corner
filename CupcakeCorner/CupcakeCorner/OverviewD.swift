//
//  OverviewD.swift
//  CupcakeCorner
//
//  Created by Oluwapelumi Williams on 18/09/2023.
//

import SwiftUI

struct OverviewD: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            // .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
        }
    }
}

struct OverviewD_Previews: PreviewProvider {
    static var previews: some View {
        OverviewD()
    }
}
