//
//  ConnectivityService.swift
// NeoProducts-VIP

//
//  Created by webwerks on 02/06/21.

//

import Foundation
import Alamofire

protocol IConnectivityService {
    var networkConnected:Bool{get}
}

struct ConnectivityService : IConnectivityService {
    /*
     use get current network status
     */
    internal var networkConnected:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
