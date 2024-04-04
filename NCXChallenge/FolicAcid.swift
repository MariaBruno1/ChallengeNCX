//
//  FolicAcid.swift
//  NCXChallenge
//
//  Created by Maria Bruno on 03/04/24.
//

import SwiftUI

struct FolicAcid: View {
    
    var currentColor: Color = .blue
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        currentColor.opacity(0.2),
                        currentColor.opacity(0.9)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(alignment:.center, spacing: 20.0) {
                    Text("Folic Acid")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(
                            Color(UIColor.black))
                        .offset(y:30)
                    VStack {
                        Text("What is folic acid?")
                            .font(.title2)
                            .fontWeight(.bold)
                            .offset(x:-80)
                        Text("Folic acid is a water-soluble vitamin of group B. It is particularly abundant in foods of plant origin. Being more or less thermolabile and unstable, this micronutrient is often degraded with cooking and during storage.")
                            .frame(width:350)
                     }
                    .frame(width: 360, height: 150)
                    .background(Color.white)
                    .cornerRadius(10)
                    .offset(y:35)
                    
                    VStack {
                        Text("Pregnancy functions")
                            .font(.title2)
                            .fontWeight(.bold)
                            .offset(x:-65)
                        Text("It is essential for the carrying out of numerous physiological processes of growth, metabolism and cellular differentiation. In our body, it participates in the synthesis processes of nucleic acids (DNA and RNA), of some amino acids (from which proteins) and of red blood cells .")
                            .frame(width:350)
                    }
                    .frame(width: 360, height: 200)
                    .background(Color.white)
                    .cornerRadius(10)
                    .offset(y:40)
                    
                    VStack {
                        Text("Major food sources")
                            .font(.title2)
                            .fontWeight(.bold)
                            .offset(x:-75)
                        Text("The foods naturally richest in folate are broad-leaved vegetables, such as artichokes, broccoli, asparagus, spinach, lettuce and endive; but we can also find them in abundance in brewer's yeast, liver, legumes (beans, peas and chickpeas), eggs, oranges, kiwis, strawberries, nuts and muesli. Fermented milks such as, for example, yogurt and kefir are also very rich in folate. A Fermented milks rich in folate are able to significantly increase the level of hemoglobin in the blood.")
                            .frame(width:350)
                    }
                    .frame(width: 360, height: 330)
                    .background(Color.white)
                    .cornerRadius(10)
                    .offset(y:45)
                }
                
            }
        }
    }
}

#Preview {
    FolicAcid()
}
