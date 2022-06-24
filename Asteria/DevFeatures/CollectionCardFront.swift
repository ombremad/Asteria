//
//  MargauxWIP.swift
//  Asteria
//
//  Created by apprenant70 on 17/06/2022.
//

import SwiftUI

struct CardFront: Identifiable {
    var id = UUID()
    var cardFrontImage: String
    var cardTitle: String
    var cardNumber: String
    var collectionName: String
    var miniCard: Bool
}

struct CollectionCardFront: View {
    
    @State private var shadowValue:Double = 0  // for miniCard shadow animation
    var collectionCardFront: CardFront
    
    var body: some View {
        
        VStack {
            ZStack {
                
                Image(collectionCardFront.cardFrontImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: collectionCardFront.miniCard ? 172 : 299, height: collectionCardFront.miniCard ? 344 : 597)
                    .clipped()
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(collectionCardFront.miniCard ? Color("CarnationPink").opacity(0.7) : Color("LavenderBlush").opacity(0.7), lineWidth: 1))
                    .shadow(color: collectionCardFront.miniCard ? Color("CarnationPink").opacity(0.9) : Color("LavenderBlush").opacity(0.9), radius: collectionCardFront.miniCard ? shadowValue : 10)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 6).delay(2)) {
                            shadowValue = 150
                        }
                    }
                
                VStack {
                    Spacer()
                        .frame(height:30)
                    
                    if collectionCardFront.miniCard == false {
                        Text(collectionCardFront.cardTitle.uppercased())
                            .font(.custom("Montserrat", size: 30))
                            .fontWeight(.light)
                            .tracking(5)
                    }
                    
                    Spacer()
                    
                    VStack(spacing:5) {
                        
                        // ROND + NUMERO CARTE
                        ZStack {
                            Circle()
                                .fill(Color("OxfordBlue"))
                                .frame(height: collectionCardFront.miniCard ? 70 : 40)
                            
                            Text(collectionCardFront.cardNumber)
                                .font(.custom("Montserrat", size: collectionCardFront.miniCard ? 50 : 24))
                                .fontWeight(.semibold)
                        } // fin
                        
                        if collectionCardFront.miniCard == false {
                            Text("Collection".uppercased())
                                .font(.custom("Montserrat", size: 15))
                                .fontWeight(.light)
                                .tracking(4)
                            
                            Text(collectionCardFront.collectionName.uppercased())
                                .font(.custom("Montserrat", size: 15))
                                .fontWeight(.semibold)
                                .tracking(3)
                        }
                    }
                    
                    Spacer()
                        .frame(height:30)
                    
                }
                .frame(width: collectionCardFront.miniCard ? 172 : 299, height: collectionCardFront.miniCard ? 344 : 597)
                .clipped()
                
                // fin Vstack
                
            } // fin Zstack
            
            
            // this is only for the miniCard
            if collectionCardFront.miniCard == true {
                Spacer()
                    .frame(height:24)
                Text("Collection".uppercased())
                    .font(.custom("Montserrat", size: 18))
                    .fontWeight(.light)
                    .tracking(4)
                Text(collectionCardFront.collectionName.uppercased())
                    .font(.custom("Montserrat", size: 18))
                    .fontWeight(.semibold)
                    .tracking(4)
            }
        }
    }
}

struct CollectionCardFront_Previews: PreviewProvider {
    static var previews: some View {
        CollectionCardFront(collectionCardFront: CardFront(cardFrontImage: "card-background-image", cardTitle: "Titre", cardNumber: "1", collectionName: "Nom de la collection", miniCard: true))
            .preferredColorScheme(.dark)
    }
}