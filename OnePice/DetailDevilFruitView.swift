//
//  DetailDevilFruitView.swift
//  OnePice
//
//  Created by Huy Than Duc on 01/05/2021.
//

import SwiftUI

struct DetailDevilFruitView: View {
    var devilFruit: DevilFruit
    var color: Color
    
    var body: some View {
        VStack(spacing: 15) {
            Text(devilFruit.name)
                .font(.system(size: 32, weight: .black, design: .monospaced))
            
            Text("\(devilFruit.price) B")
                .font(.system(size: 24, weight: .bold, design: .rounded))
            
            Image(devilFruit.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(.bottom, UIApplication.shared.windows.last?.safeAreaInsets.bottom ?? 0 + 10)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(color)
        .cornerRadius(25)
        .edgesIgnoringSafeArea(.top)
    }
}
