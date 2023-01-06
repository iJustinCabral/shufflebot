//
//  HomeView.swift
//  ShuffleBot
//
//  Created by Justin Cabral on 1/5/23.
//

import SwiftUI

struct HomeView: View {
    
    private let games: [ShuffleGame] = [
        ShuffleGame(name: "Name Picker", imageName: "person.text.rectangle"),
        ShuffleGame(name: "Team Picker", imageName: "person.3.fill"),
        ShuffleGame(name: "Yankee Swap", imageName: "rectangle.2.swap"),
        ShuffleGame(name: "Flip A Coin", imageName: "centsign.square.fill"),
        ShuffleGame(name: "Decision Maker", imageName: "person.fill.questionmark"),
        ShuffleGame(name: "Roll Die", imageName: "dice.fill")
    ]
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 170)) ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.mint, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        HStack() {
                            Text("Shuffle Bot")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }.padding()
                        
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(games, id:\.self) { game in
                                ItemView(title: game.name, imageName: game.imageName)
                            }
                        }
                        
                        Spacer()
                        
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func ItemView(title: String, imageName: String) -> some View {
        ZStack {
            Rectangle()
                .frame(width: 170, height: 170)
                .background(.thinMaterial)
                .cornerRadius(12)
            
            VStack(spacing: 30) {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 40)
                    .foregroundColor(.white)
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
                

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
