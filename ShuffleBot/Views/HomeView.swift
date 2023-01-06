//
//  HomeView.swift
//  ShuffleBot
//
//  Created by Justin Cabral on 1/5/23.
//

import SwiftUI

struct HomeView: View {
    
    private let games: [ShuffleGame] = [
        ShuffleGame(name: "Shuffle Names", imageName: "person.text.rectangle"),
        ShuffleGame(name: "Shuffle Teams", imageName: "person.3.fill"),
        ShuffleGame(name: "Yankee Swap", imageName: "rectangle.2.swap"),
        ShuffleGame(name: "Flip A Coin", imageName: "centsign.square.fill"),
        ShuffleGame(name: "Decision Maker", imageName: "person.fill.questionmark"),
        ShuffleGame(name: "Roll Die", imageName: "dice.fill")
    ]
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 140)) ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.mint, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        TitleBar()
                        
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(games, id:\.self) { game in
                                NavigationLink(value: game) {
                                    ItemView(title: game.name, imageName: game.imageName)
                                }.buttonStyle(PlainButtonStyle())
                            }
                          
                        }
                        Spacer()
                    }
                }
                .navigationDestination(for: ShuffleGame.self) { game in
                    switch game.name {
                    case "Shuffle Names":
                        NamePickerView()
                    case "Shuffle Teams":
                        TeamPickerView()
                    case "Yankee Swap":
                        YankeeSwapView()
                    case "Flip A Coin":
                        FlipCoinView()
                    case "Decision Maker":
                        DecisionMakerView()
                    case "Roll Die":
                        RollDiceView()
                    default:
                        Text("Hello Sailor!")
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
    
    @ViewBuilder
    func TitleBar() -> some View {
        HStack() {
            Text("Shuffle Bot")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("🤖")
                .font(.largeTitle)
            
        }.padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
