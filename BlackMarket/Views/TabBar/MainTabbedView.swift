//
//  MainTabbedView.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 26/09/2023.
//

import SwiftUI

struct MainTabbedView: View {
  
  @State var selectedTab = 0
  
  var body: some View {
    
    ZStack(alignment: .bottom){
      TabView(selection: $selectedTab) {
        DashboardView()
          .tag(0)
        PurchasesListView()
          .tag(1)
        ShoppingCartListView()
          .tag(2)
        FavouriteList()
          .tag(3)
        SettingsView()
          .tag(4)
      }
      
      HStack{
        ForEach((TabbedItem.allCases), id: \.self){ item in
          Button{
            selectedTab = item.rawValue
          } label: {
            customTabItemView(imageName: item.iconName, isActive: (selectedTab == item.rawValue))
          }
        }
      }
      .padding(6)
      .frame(height: 80)
      .background(.black)
    }
  }
}

extension MainTabbedView {
  func customTabItemView(imageName: String, isActive: Bool) -> some View {
    HStack(spacing: 10) {
      Spacer()
      Image(imageName)
        .resizable()
        .renderingMode(.template)
        .foregroundColor(isActive ? .black : .white)
        .frame(width: 20, height: 20)
      Spacer()
    }
    .frame(width: isActive ? .infinity : 70, height: 70)
    .background(isActive ? .gray : .clear)
    .cornerRadius(35)
  }
}

struct MainTabbedView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabbedView().environmentObject(ModelData())
  }
}
