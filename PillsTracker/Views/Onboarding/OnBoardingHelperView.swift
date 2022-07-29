//
//  OnBoardingView.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 29/07/22.
//

import SwiftUI

struct OnBoardingHelperView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection:$selection){
            OnbardingView(selection:  $selection, title: "Medcine on Time", subtitle: "Provide a regular notfification for you to take medicine on time.", image: Constants.onboarding1.rawValue, buttonTitle: "Continue")
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                .tag(0)
            
            OnbardingView(selection:  $selection, title: "Be Healty", subtitle: "By Taking a medicne on regular time , make you a healthy.", image: Constants.onboarding2.rawValue, buttonTitle: "Get Started")
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                .tag(1)
            
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(
                PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingHelperView()
    }
}
