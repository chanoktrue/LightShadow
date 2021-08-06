//
//  ContentView.swift
//  NeumorphicDesign
//
//  Created by Thongchai Subsaidee on 4/8/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var lightVM = LightViewModel()
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.3)]),
                startPoint: UnitPoint(x: 0.2, y: 0.2),
                endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            HomeView(lightVM: lightVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct HomeView: View {
    
    @ObservedObject var lightVM: LightViewModel

    
    var body: some View {
        
        TabView(selection: Binding<Int> (
                    get: {
                        
                        if lightVM.selected {
                            return 0
                        }else {
                            return 1
                        }
                    },
                    set : {
                        if $0 == 0 {
                            lightVM.selected = true
                        }else {
                            lightVM.selected = false
                        }

                    }
        )) {
                
            ForEach(lightVM.lights.indices ) { index in
                ImageView(image: lightVM.lights[index].image, name: lightVM.lights[index].name, selected: $lightVM.selected)
                        .tag(index)

                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        
    }
}

struct ImageView: View {
    
    var image: String = ""
    var name: String = ""
    @Binding var selected: Bool
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 25.0)
            .stroke(Color.gray, lineWidth: 2)
            .padding(.vertical, 60)
            .padding()
            .overlay(
                
                VStack {
                    
                    LinearGradient(
                        gradient: Gradient(colors: [Color.red, Color.blue]),
                        startPoint: .leading,
                        endPoint: .trailing)
                        .mask(
                            Image(systemName: image)
                                .resizable()
                                .scaledToFit()
                        )
                        .frame(width: 250, height: 300)
                        .padding(60)
                        .shadow(color: .white, radius: 2, x: -3, y: -3)
                        .shadow(color: .gray, radius: 2, x: 3, y: 3)
                    
                    
                    Text(name)
                        .font(.custom("Sukhumvit set", size: 30))
                        .foregroundColor(.gray)
                    
                    }
            )
            .onTapGesture {
                withAnimation(Animation.easeIn(duration: 0.3)) {
                    selected.toggle()
                }
            }
        
        
    }
}
