//
//  OverviewA.swift
//  CupcakeCorner
//
//  Created by Oluwapelumi Williams on 18/09/2023.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
    @Published var name = "Paul Hudson"
}

struct OverviewA: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OverviewA_Previews: PreviewProvider {
    static var previews: some View {
        OverviewA()
    }
}
