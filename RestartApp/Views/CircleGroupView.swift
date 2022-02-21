//
//  CircleGroupView.swift
//  RestartApp
//
//  Created by LUIZ FELIPE ALVES LIMA on 06/02/22.
//

import SwiftUI

struct CircleGroupView: View {
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating : Bool = false
    var body: some View {
       
        ZStack{
            Circle().stroke(lineWidth: 80).foregroundColor(shapeColor.opacity(shapeOpacity)).frame(width: 250, height: 250, alignment: .center)
            Circle().stroke(lineWidth: 40).foregroundColor(shapeColor .opacity(shapeOpacity)).frame(width: 250, height: 250, alignment: .center)
        }.blur(radius: isAnimating ? 0 : 10)
            .opacity(isAnimating ? 1 : 0)
            .scaleEffect(isAnimating ? 1 : 0.5 )
            .animation(.easeOut(duration: 1), value: isAnimating)
            .onAppear(){
                isAnimating = true
            }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea()
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
