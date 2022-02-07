//
//  OnBoadingView.swift
//  RestartApp
//
//  Created by LUIZ FELIPE ALVES LIMA on 05/02/22.
//

import SwiftUI

struct OnBoadingView: View {
    
    @AppStorage("onboardingActive") var isOnboardingActive: Bool = true
    
    @State private var  buttonWidth =  UIScreen.main.bounds.width-80
    
    @State private var buttonOffset: CGFloat = 0
     
    var body: some View {
       
        ZStack {
            Rectangle().foregroundColor(Color("ColorBlue")).ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                
              
                Text("Share.").font(.system(size: 60)).fontWeight(.heavy).foregroundColor(.white)
                Text("""
                     It`s not how much we give
                     but how much love we put into giving
                     """).font(.title3.weight(.light)).foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                
                ZStack{
                  
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    Image("character-1").resizable().scaledToFit()
                }

                
                Spacer()
                
                ZStack{
            
                    Capsule().foregroundColor(.white.opacity(0.2))
                    
                    Capsule().foregroundColor(.white.opacity(0.2)).padding(.all,10)
                    HStack{
                        Spacer()
                        Text("Get Started").font(.system( .title3,design: .rounded)).fontWeight(.bold).foregroundColor(.white).offset(x: 20 )
                        Spacer()
                    }
                    HStack{
                        Capsule().frame(width:buttonOffset + 80 ,height: 80).foregroundColor(Color("ColorRed")).padding(.all,0)
                   
                        Spacer(minLength: 0)
                    }
                   
                    HStack{
                        ZStack {
                            Circle().frame(width:80).foregroundColor(Color("ColorRed"))
                            Circle().frame(width:80).foregroundColor(.black.opacity(0.2))
                            Image(systemName: "chevron.right.2").font(.system(size: 20).weight(.heavy))
                                
                                .foregroundColor(.white)
                        }
                        
                        .offset(x:buttonOffset)
                        .frame(height: 65 ).gesture(DragGesture().onChanged{
                            gesture in
                            let width = gesture.translation.width
                            
                            if(width>=0 && width <= (buttonWidth - 80)){
                                buttonOffset = width
                            }
                        }
                                                        .onEnded{
                            gesture in
                            if(buttonOffset < (buttonWidth * 0.7)){
                                buttonOffset = 0
                            }else{
                                isOnboardingActive = false;
                            }
                        }
                        )
                       
                    
                        Spacer()
                    }
                    
                    
                }.frame(
                    width:buttonWidth,
                    height: 80, alignment: .center)
               
            
                
            }.padding(.all,40)
        }
    }
}

struct OnBoadingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoadingView()
    }
}
