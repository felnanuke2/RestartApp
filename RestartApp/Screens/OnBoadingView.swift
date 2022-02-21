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
    
    @State private var isAnimated : Bool = false
    
    @State private var imageOffset : CGFloat = 0
    
    @State private var imageAngle : CGFloat = 0
    
    @State private var titleText : String = "Share."
    
    var hapticFeedback = UINotificationFeedbackGenerator()
     
    var body: some View {
       
        ZStack {
            Rectangle().foregroundColor(Color("ColorBlue")).ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // MARK: Header
              
                VStack{
                    Text(titleText).font(.system(size: 60)).fontWeight(.heavy).foregroundColor(.white)
                        .transition(.opacity)
                        .id(titleText)
                        
                    Text("""
                         It`s not how much we give
                         but how much love we put into giving
                         """).font(.title3.weight(.light)).foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }.opacity(isAnimated ? 1 : 0 )
                    .offset(y: isAnimated ? 0 : -40)
                    .animation(.easeOut(duration: 1), value: isAnimated)
                Spacer()
                
            //MARK: CENTER
                ZStack{
                  
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x: -imageOffset)
                        .blur(radius: abs(imageOffset / 5))
                    Image("character-1").resizable().scaledToFit()
                        .rotationEffect(.degrees(imageAngle))
                        .offset(x: imageOffset)
                      
                        .gesture(DragGesture().onChanged{
                            gesture in
                            let width = gesture.translation.width
                            if(abs(width) <= 100){
                                imageOffset = width
                                imageAngle = width / 19
                              
                            }
                            titleText = "Give."
                           
                           
                            
                        }
                                    .onEnded{_ in
                            withAnimation(.easeOut(duration: 0.4)){
                                imageOffset = 0
                                imageAngle  = 0
                                titleText = "Share."
                            }
                          
                        }
                        )
                   
                       
                }
               
               
                .opacity(isAnimated ? 1 : 0)
                    .animation(.easeOut(duration: 0.5), value: isAnimated)

                
                Spacer()
                
                // MARK: Bottom
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
                            withAnimation(Animation.easeOut(duration: 0.4)){
                                if(buttonOffset < (buttonWidth * 0.7)){
                                    buttonOffset = 0
                                    hapticFeedback.notificationOccurred(.warning)
                                }else{
                                    playSound(sound: "chimeup", type: "mp3")
                                    hapticFeedback.notificationOccurred(.success)
                                    isOnboardingActive = false;
                                }
                            }
                        }
                        )
                       
                    
                        Spacer()
                    }
                    
                    
                }.frame(
                    width:buttonWidth,
                    height: 80, alignment: .center)
                    .opacity(isAnimated ? 1 : 0)
                    .offset(y: isAnimated ? 0 : 40)
                    .animation(.easeOut(duration: 1), value: isAnimated)
               
            
                
            }.padding(.all,40)
             
        }.onAppear{
            isAnimated = true;
        }
    }
}

struct OnBoadingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoadingView()
    }
}
