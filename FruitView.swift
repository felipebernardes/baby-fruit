//
//  FruitView.swift
//  babyfruit WatchKit Extension
//
//  Created by Felipe Bernardes on 25/10/19.
//  Copyright © 2019 Felipe Bernardes. All rights reserved.
//

import SwiftUI

struct FruitView: View {
    @State private var weeks_pregnant: Int = 15
    
    var body: some View {
        VStack {
            Text("BabyFruit").bold().italic()
            Image("fruit_week\(weeks_pregnant)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("You are \(weeks_pregnant) weeks pregnant, and your child is currently as big as this fruit!").foregroundColor(.white).bold().italic().lineLimit(6).multilineTextAlignment(.center)
        }
    }
}

struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        FruitView()
    }
}
