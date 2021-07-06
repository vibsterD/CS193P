//
//  ContentView.swift
//  Memomrize
//
//  Created by Vibhu Dubey on 10/06/21.
//

import SwiftUI

struct ContentView: View {
    @State var theme1 = ["🤧", "👀", "😎", "☺️","😂", "🤌", "😫", "😇", "😙", "🧐", "🙃", "😛", "😱","🤯", "😨", "🤗", "😬", "😵‍💫", "😷", "🤑", "🤒", "😵", "🤫"]
    @State var theme2 = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅", "🚂", "🚆", "🚇", "🚊", "🚉", "✈️", "🛫", "🚁", "🛸"]
    @State var theme3 = ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈","🏳️‍⚧️","🇺🇳","🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇪", "🇧🇿", "🇧🇯", "🇧🇲", "🇧🇹", "🇧🇴", "🇧🇦", "🇧🇼", "🇧🇷", "🇻🇬", "🇧🇳", "🇭🇰", "🇸🇨", "🇺🇸", "🇮🇳", "🇮🇸", "🇭🇹"]
    @State var currTheme = 1
    @State var emojiCount = 13
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.title)
                .foregroundColor(Color.blue)
            ScrollView{
                switch currTheme{
                case 1:
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                        ForEach(theme1[0..<emojiCount], id: \.self ,content: {emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        })
                    }
                case 2:
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                        ForEach(theme2[0..<emojiCount], id: \.self ,content: {emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        })
                    }
                case 3:
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                        ForEach(theme3[0..<emojiCount], id: \.self ,content: {emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        })
                    }
                default:
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                        ForEach(theme1[0..<emojiCount], id: \.self ,content: {emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        })
                    }
                }
            }
            Spacer()
            HStack {
                theme1Select
                Spacer()
                theme2Select
                Spacer()
                theme3Select
            }
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
            
            
//            HStack {
//                addCard
//                Spacer()
//                removeCard
//            }
//            .font(.largeTitle)
        }
        .padding(.horizontal, 5.0)

    }
    
    var theme1Select: some View {
        Button(action: {
            theme1.shuffle()
            currTheme = 1
            emojiCount = 13
        }, label: {
            VStack{
                Image(systemName: "face.smiling")
                Text("Faces")
                    .font(.caption)
            }
        })
    }
    var theme2Select: some View {
        Button(action: {
            theme2.shuffle()
            currTheme = 2
            emojiCount = 14
        }, label: {
            VStack{
                Image(systemName: "car.circle")
                Text("Vehicles")
                    .font(.caption)
            }
        })
    }
    var theme3Select: some View {
        Button(action: {
            theme3.shuffle()
            currTheme = 3
            emojiCount = 15
        }, label: {
            VStack{
                Image(systemName: "flag.circle")
                Text("Flags")
                    .font(.caption)
            }
        })
    }
    
    var addCard: some View {
        Button(action: {
            if emojiCount < theme1.count {
                emojiCount += 1
            }
            
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    var removeCard: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
            
        }, label: {
                Image(systemName: "minus.circle")
        })
    }
    
    
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    
    var content: String
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        
        ZStack{
            // combines the bag of legos returned by content:{}
            // viewbuilder function for content attribute of ZStack
            // returns bag of legos!
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                
                shape
                    .strokeBorder(lineWidth: 3)
                    .foregroundColor(.orange)
                
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .padding()
            }else{
                shape
                    .fill()
                    .foregroundColor(.orange)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }

    }
}





// glue code for rendering the preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
