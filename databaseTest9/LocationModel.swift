//
//  LocationModel.swift
//  databaseTest9
//
//  Created by nuub Mediastyle on 13/03/2023.
//

import Foundation

class LocationModel: NSObject {
    
    //properties
    
    var Navn: String?
    var Alder: Int?
    var Brugernavn: String?
    var Password: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(Alder: Int, Navn: String, Brugernavn: String, Password: String) {
        
        self.Alder = Alder
        self.Navn = Navn
        self.Brugernavn = Brugernavn
        self.Password = Password
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Name: \(String(describing: Alder)), Address: \(String(describing: Navn)), Latitude: \(String(describing: Brugernavn)), Longitude: \(String(describing: Password))"
        
    }
    
    
}

