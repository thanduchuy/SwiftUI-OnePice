//
//  ContentView.swift
//  OnePice
//
//  Created by Huy Than Duc on 01/05/2021.
//

import SwiftUI

struct ContentView: View {
    var devilFruits = [
        DevilFruit(id: 1, image: "gomu", name: "Gomu Gomu No Mi", price: 750000000),
        DevilFruit(id: 2, image: "hito", name: "Hito Hito no Mi", price: 940000000),
        DevilFruit(id: 3, image: "ope", name: "Ope Ope no Mi", price: 550000000),
        DevilFruit(id: 4, image: "yami", name: "Yami Yami no Mi", price: 850000000),
        DevilFruit(id: 5, image: "gura", name: "Gura Gura no Mi", price: 999000000)
    ]
    
    var colors = [
        Color("red"),
        Color("yellow"),
        Color("blue")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var show = false
    @State var fruitSelect = DevilFruit(id: 1, image: "gomu", name: "Gomu Gomu No Mi", price: 750000000)
    
    var body: some View {
        ZStack {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 30)
                
                Text("Devil Fruits")
                    .font(.system(size: 40, weight: .black, design: .monospaced))
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(devilFruits, id: \.self) { item in
                            VStack {
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                HStack {
                                    Spacer()
                                    
                                    Text("\(item.price) B")
                                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    
                                    Spacer()
                                }
                            }
                            .padding()
                            .background(colors.randomElement())
                            .cornerRadius(20)
                            .onTapGesture {
                                self.show.toggle()
                                self.fruitSelect = item
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            VStack {
                Spacer()
                
                DetailDevilFruitView(devilFruit: fruitSelect,
                                     color: colors.randomElement() ?? Color.white)
                    .offset(y: self.show ? 0 : UIScreen.main.bounds.height)
            }
            .background((self.show ? Color.black.opacity(0.3) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                self.show.toggle()
                            })
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
