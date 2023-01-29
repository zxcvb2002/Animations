//
//  ContentView.swift
//  Animations
//
//  Created by 드즈 on 2023/01/29.
//

import SwiftUI

struct ContentView: View {
    
    @State var backViewSize: CGFloat = 80
    @State var size: CGSize = .zero
    
    var body: some View {
        
        // geometry property is used to read parent view size or coordinates...
        GeometryReader { reader in
            
            ZStack {

                VStack {
                    
                    Color.blue
                    
                }.frame(width: reader.size.width - 120, height: 295)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: -30)
                
                VStack {
                    
                    Color.orange
                    
                }.frame(width: reader.size.width - self.backViewSize, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: -15)
                
                
                VStack {
                    
                    Color.red
                    
                }.frame(width: reader.size.width - 50, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                .gesture(DragGesture().onChanged({ (value) in
                    
                    self.size = value.translation
                    self.backViewSize = 20
                })
                .onEnded({ (value) in
                    
                    self.size = .zero
                    self.backViewSize = 80
                }))
                .offset(self.size)
            }
        }
        .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
