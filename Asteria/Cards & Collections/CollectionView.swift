//
//  CollectionView.swift
//  Asteria
//
//  Created by Apprenant 87 on 20/06/2022.
//
//  NOTE : les images s'afficheront une fois ajoutées dans les assets et renseignées correctement dans les data
//
//  Reste à faire sur cet écran :
//  - ajouter le background
//  - voir s'il est possible de personnaliser le navigation title (mettre le fond bleu, changer la taille / le style du texte)

import SwiftUI


struct CollectionView: View {
    
    var body: some View {
        
        NavigationView {
        
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.5)
                Color("OxfordBlue").opacity(0.3)
                    .ignoresSafeArea()
                
                VStack {
                
                ScrollView {
                
                    CollectionDetail(collection: collection1)
                    
                    CollectionDetail(collection: collection2)
                    
                }
            
                }
                
                .navigationTitle("C O L L E C T I O N S")
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
            .preferredColorScheme(.dark)
            
    }
}