//
//  ProfilData.swift
//  Asteria
//
//  Created by apprenant50 on 29/06/2022.
//

import Foundation


var CurrentUser = User(nom: "user", prenom: "Invité", email: "none", age: 18, level: "Niveau Or", isUser: true)
var users: [User] = []


struct User{
    var nom, prenom, email: String
    var age: Int
    var image: String
    var level: String
    let isUser: Bool
    
    
    init()
    {
        self.nom = "Nom Invité"
        self.prenom =  ""
        self.email = ""
        self.age = 0
        self.image = "person.circle"
        self.level = ""
        self.isUser = true
       }
    
    
    init(nom: String, prenom: String, email: String, age: Int, level: String)
    {
        self.nom = nom
        self.prenom = nom
        self.email = email
        self.age = age
        self.image = "person.circle"
        self.level = level
        self.isUser =  false
        
    }
    
    
    init(nom: String, prenom: String,  email: String,age: Int, level: String, isUser: Bool)
    {
        self.nom = nom
        self.prenom = nom
        self.email = email
        self.age = age
        self.image = "person.circle"
        self.level = level
        self.isUser =  isUser
        
    }
  }





final class UserViewModel: ObservableObject {
    
    @Published var cur = CurrentUser
     @Published var us = users

    
    
    func userLogn(user: User) {
        self.cur = user
    }
    
}

