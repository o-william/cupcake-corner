//
//  OverviewC.swift
//  CupcakeCorner
//
//  Created by Oluwapelumi Williams on 18/09/2023.
//

import SwiftUI

struct OverviewC: View {
    var body: some View {
        // AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
        //        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
        //            image
        //                .resizable()
        //                .frame(width: 200, height: 200)
        //        } placeholder: {
        //            // Color.red
        //            ProgressView()
        //        }
        //        .frame(width: 200, height: 200)
        //    }
        
        // ANOTHER WAY OF CREATING ASYNCIMAGE
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct OverviewC_Previews: PreviewProvider {
    static var previews: some View {
        OverviewC()
    }
}
