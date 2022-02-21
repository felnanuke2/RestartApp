//
//  HomeView.swift
//  RestartApp
//
//  Created by LUIZ FELIPE ALVES LIMA on 05/02/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboardingActive") var isOnboardingActive: Bool = false
    @State private var isAnimating : Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2").resizable().scaledToFit().padding()
                    .offset(y : isAnimating ? -35 : 35)
                    .animation(.easeOut(duration: 4).repeatForever(),
                               value: isAnimating)
                
            }
            
            
            Text("The time that leads to mastery is dependent on intensity of your focus").font(.title3).fontWeight(.light).foregroundColor(.secondary).multilineTextAlignment(.center).padding()
            
            Spacer()
         
            Button(action:{
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnboardingActive = true;
                    
                }
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill").imageScale(.large)
                Text("Reset").font(.system(.title3,design: .rounded)).fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent).buttonBorderShape(.capsule ).controlSize(.large)
         
        }.padding(.all,40)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()
                                              + 0.5){
                    isAnimating = true
                }
            }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
