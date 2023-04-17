//
//  HomeModel.swift
//  databaseTest9
//
//  Created by nuub Mediastyle on 13/03/2023.
//

import Foundation

protocol HomeModelProtocol: AnyObject {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "http://test-postnord.dk/service.php"
 
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
                print(data!)
                print(response!)
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
                print(data!)
                print(response!)
                
            }
            
        }
        
        task.resume()
    }
    func parseJSON(_ data:Data) {
           
           var jsonResult = NSArray()
           
           do{
               jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
               
               
               
           } catch let error as NSError {
               print(error)
               
           }
           
           var jsonElement = NSDictionary()
           let locations = NSMutableArray()
           
           for i in 0 ..< jsonResult.count
           {
               
               jsonElement = jsonResult[i] as! NSDictionary
               
               let location = LocationModel()
               
               //the following insures none of the JsonElement values are nil through optional binding
               if let Navn = jsonElement["Navn"] as? String,
                   let Alder = jsonElement["Alder"] as? Int,
                   let Brugernavn = jsonElement["Brugernavn"] as? String,
                   let Password = jsonElement["Password"] as? String
               {
                   
                   location.Navn = Navn
                   location.Alder = Alder
                   location.Brugernavn = Brugernavn
                   location.Password = Password
                   
               }
               
               locations.add(location)
               
           }
           
           DispatchQueue.main.async(execute: { () -> Void in
               
               self.delegate.itemsDownloaded(items: locations)
               
           })
       }

}
