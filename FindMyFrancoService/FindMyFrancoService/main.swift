//
//  main.swift
//  FindMyFrancoService
//
//  Created by Ethan Link on 2/19/22.
//

import Foundation

let url = "oneplus7t.wifi.uc.edu"

//strdup(url)
let response = String(cString: get_hostname(strdup(url)));
let ipAddr = response.split(separator: "\t")[2];

let params : Dictionary<String, String> = ["time": String(NSDate().timeIntervalSince1970)];

var apiRequest = URLRequest(url: URL(string: "https://tbd")!); //! unwraps the URL instance, will throw error if value is nil
apiRequest.httpMethod = "POST"
apiRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
apiRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")


let session = URLSession.shared
let task = session.dataTask(with: apiRequest) { data, response, error in
    
    guard let data = data else {
            print("URLSession dataTask error:", error ?? "nil")
            return
    }
    do{
        let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
    } catch {
        print("An error has occurred")
    }
}

task.resume()
print(ipAddr)
