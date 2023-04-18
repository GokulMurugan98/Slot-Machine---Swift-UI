//
//  ContentView.swift
//  SlotMachine-SwiftUI
//
//  Created by Gokul Murugan on 2023-04-18.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let p1 = CGPoint(x: 0, y: 20)
            let p2 = CGPoint(x: 0, y: rect.height - 20)
            let p3 = CGPoint(x: rect.width/2, y: rect.height)
            let p4 = CGPoint(x: rect.width, y: rect.height - 20)
            let p5 = CGPoint(x: rect.width, y: 20)
            let p6 = CGPoint(x: rect.width/2, y: 0)
            
            path.move(to: p6)
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 15)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 15)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 15)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: 15)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: 15)
            path.addArc(tangent1End: p6, tangent2End: p1, radius: 15)
            
        }
    }
}

enum res: Int,Identifiable{
    var id: Int{
        return rawValue
    }
    case success,failure
}

struct ContentView: View {
    @State var iconNames = ["eating", "happy", "love", "scary", "sleeping"]
    @State var numbers = [0,1,2,3,4]
    @State var life = 0
    @State private var showAlert:res?
    var body: some View {
        ZStack(alignment: .center){
            Image("sunshine")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack(alignment: .center,spacing: 50){
                Spacer()
                HStack(spacing: 10){
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 1, y: 5)
                    Text("SLOT MACHINE")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .shadow(color: .orange, radius: 0.5, y: 5)
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 1, y: 5)
                }
                .frame(width: (UIScreen.main.bounds.width - 20),height: 60,alignment: .center)
                Text("Lives left : \(10 - life)")
                    .font(.system(size: 50))
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .shadow(color: .white, radius: 10)
                VStack{
                    HStack(spacing: 30){
                        Hexagon()
                            .frame(width: 100,height: 120,alignment: .center)
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .overlay(
                                Image(iconNames[numbers[0]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80,alignment: .center)
                                    .shadow(radius: 5,x:5,y: 5)
                            )
                            .shadow(radius: 5,x: 3,y: 5)
                        
                        Hexagon()
                            .frame(width: 100,height: 120,alignment: .center)
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .overlay(
                                Image(iconNames[numbers[1]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80,alignment: .center)
                                    .shadow(radius: 5,x:5,y: 5)
                            )
                            .shadow(radius: 5,x: 3,y: 5)
                    }
                    Hexagon()
                        .frame(width: 100,height: 120,alignment: .center)
                        .foregroundColor(.white)
                        .opacity(0.7)
                        .overlay(
                            Image(iconNames[numbers[2]])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,height: 80,alignment: .center)
                                .shadow(radius: 5,x:5,y: 5)
                        )
                        .shadow(radius: 5,x: 3,y: 5)
                    HStack(spacing: 30){
                        Hexagon()
                            .frame(width: 100,height: 120,alignment: .center)
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .overlay(
                                Image(iconNames[numbers[3]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80,alignment: .center)
                                    .shadow(radius: 5,x:5,y: 5)
                            )
                            .shadow(radius: 5,x: 3,y: 5)
                        
                        Hexagon()
                            .frame(width: 100,height: 120,alignment: .center)
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .overlay(
                                Image(iconNames[numbers[4]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80,alignment: .center)
                                    .shadow(radius: 5,x:5,y: 5)
                            )
                            .shadow(radius: 5,x: 3,y: 5)
                    }
                }
                Button {
                    numbers[0] = Int.random(in: 0...(iconNames.count - 1))
                    numbers[1] = Int.random(in: 0...(iconNames.count - 1))
                    numbers[2] = Int.random(in: 0...(iconNames.count - 1))
                    numbers[3] = Int.random(in: 0...(iconNames.count - 1))
                    numbers[4] = Int.random(in: 0...(iconNames.count - 1))
                    
                    life += 1
                    if numbers[0] == numbers[1] && numbers[1] == numbers[2] && numbers[2] == numbers[3] && numbers[3] == numbers[4] && numbers[4] == numbers[0] {
                        showAlert = .success
                        life = 0
                    }
                    
                    
                    if life >= 10
                    {
                        showAlert = .failure
                        life = 0
                    }
                    
                    
                } label: {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.cyan)
                        .frame(width: 200,height: 50,alignment: .center)
                        .shadow(radius: 5,x: 3,y: 5)
                        .overlay(
                            Text("Spin")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .fontWeight(.semibold))
                }
                Spacer()
            }
            
            .alert(item: $showAlert) { alert -> Alert in
                switch alert{
                case .success:
                    return Alert(title: Text("You win!"),message: Text("You are one in a million!"),dismissButton: .cancel())
                case .failure:
                    return Alert(title: Text("You loose!"),message: Text("Better luck next time"),dismissButton: .cancel())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
