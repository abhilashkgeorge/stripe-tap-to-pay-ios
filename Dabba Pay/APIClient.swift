//
//  APIClient.swift
//  Dabba Pay
//
//  Created by Abhilash Knox George on 13/05/24.
//

import Foundation
import Alamofire
import StripeTerminal

class APIClient: NSObject, ConnectionTokenProvider {
    // This comes from `AppDelegate.backendUrl`, set URL there
    var baseURLString: String?
    
    private var baseURL: URL {
        if let urlString = self.baseURLString, let url = URL(string: urlString) {
            return url
        } else {
            fatalError()
        }
    }
    
    // MARK: ConnectionTokenProvider
    func fetchConnectionToken(_ completion: @escaping ConnectionTokenCompletionBlock) {
        let url = self.baseURL.appendingPathComponent("connection_token")
        
        AF.request(url, method: .post, parameters: [:])
            .validate(statusCode: 200..<300)
            .stripeResponseJSON { (result, afDataResponse) in
                switch result {
                case .success(let json):
                    if let secret = json["secret"] as? String {
                        print( "Secret Fetched", secret)
                        completion(secret, nil)
                    } else {
                        fallthrough // fallthrough and report failed to decode
                    }
                case .failure where afDataResponse.response?.statusCode == 402:
                    let description = afDataResponse.data.flatMap({ String(data: $0, encoding: .utf8) })
                    ?? "Failed to decode connection token"
                    let error = NSError(domain: "example",
                                        code: 1,
                                        userInfo: [
                                            NSLocalizedDescriptionKey: description
                                        ])
                    completion(nil, error)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}


