//
//  ContentView.swift
//  Memomrize
//
//  Created by Vibhu Dubey on 10/06/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var modelView: EmojiMemoryGame
    
    var body: some View {
        VStack{
            HStack() {
                Text("0")
                Spacer()
                Text("Memorize!")
                    .padding(.leading, 65.0)
//                    .padding(.trailing, 30.0)
                    
                Spacer()
                Button(action: {}){
                    Text("New Game")
                }.font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
            }
            .padding(0.0)
            .font(.title)
            .foregroundColor(Color.blue)

            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(modelView.cards, content: {card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                modelView.choose(card)
                            }
                    })
                }
            }
            
            HStack {
                Button(action: {
                        print("hellllll")
                        modelView.changeTheme(-1)},
                       label: {
                    Image(systemName: "lessthan.circle")
                })
                Spacer()
                Text("Theme: Flags")
                Spacer()
                Button(action: {
                        print("sdadsa")
                        modelView.changeTheme(+1)},
                       label: {
                    Image(systemName: "greaterthan.circle")
                })
            }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
        }
        .padding(.horizontal, 5.0)

    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        
        ZStack{
            // combines the bag of legos returned by content:{}
            // viewbuilder function for content attribute of ZStack
            // returns bag of legos!
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                
                shape
                    .strokeBorder(lineWidth: 3)
                    .foregroundColor(.orange)
                
                Text(card.content)
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .padding()
            }else if card.isMatched {
                shape.opacity(0)
            }
            else{
                shape
                    .fill()
                    .foregroundColor(.orange)
            }
        }

    }
}





// glue code for rendering the preview
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(modelView: game)
            .preferredColorScheme(.light)
        ContentView(modelView: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
