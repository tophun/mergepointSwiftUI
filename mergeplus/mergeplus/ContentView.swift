//
//  ContentView.swift
//  mergeplus
//
//  Created by Tophun_mh on 2020/06/19.
//  Copyright © 2020 mergepoint. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
  @ObservedObject var viewModel = VersionViewModel()
  
  var body: some View {
      
    ZStack(alignment: .center) {
      Color.signitureRed
        .edgesIgnoringSafeArea(.all)
      VStack(alignment: .center) {
        Spacer()
        VStack(alignment: .center, spacing: 15) {
          Image("mergeSymbolLogo").offset(x: 0, y: 0)
          Image("mergeTypoLogo")
          }
        
        Spacer()
        Image("mergeholdings")
          .padding(.bottom, 43)
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
