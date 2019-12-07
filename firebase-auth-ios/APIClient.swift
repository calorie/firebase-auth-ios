//
//  APIClient.swift
//  firebase-auth-ios
//
//  Created by yu on 2019/12/07.
//  Copyright © 2019 example. All rights reserved.
//

import Firebase
import Foundation
import Alamofire
import SwiftyJSON
import Spine

final class APIClient {
    static let sharedInstance = APIClient()
    
    var serializer: Serializer
    
    private init() {
        serializer = Serializer()
    }

    func createUser(token: String, success: @escaping () -> Void, failure: @escaping () -> Void) {
        let baseURL = URL(string: API_HOST + "/v1/users")!
        let headers: HTTPHeaders = ["Authorization": String(format: "Bearer %@", token)]
        Alamofire.request(baseURL, method: .post, parameters: nil, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
            switch response.result {
            case .success(_):
                success()
            case .failure(_):
                failure()
            }
        }
    }
}
