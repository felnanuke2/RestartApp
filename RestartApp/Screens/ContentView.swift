//
//  ContentView.swift
//  RestartApp
//
//  Created by LUIZ FELIPE ALVES LIMA on 29/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboardingActive") var isOnboardingActive: Bool = true
    
     
    var body: some View {
        ZStack{
            if isOnboardingActive{
                OnBoadingView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
