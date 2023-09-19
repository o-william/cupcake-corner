//
//  OverviewB.swift
//  CupcakeCorner
//
//  Created by Oluwapelumi Williams on 18/09/2023.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}


struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct OverviewB: View {
    @State private var results = [Result]()
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
}

struct OverviewB_Previews: PreviewProvider {
    static var previews: some View {
        OverviewB()
    }
}
