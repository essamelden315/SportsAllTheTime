//
//  NetworkReachability.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 05/06/2023.
//

import Foundation
import SystemConfiguration
class NetworkReachability{
   static func checkNetworkConnection() -> Bool {
        //create IP address and port number for the internet connection.
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))//size of the zeroAddress structure
        zeroAddress.sin_family = sa_family_t(AF_INET)// ipv4
        //to create a pointer to zeroAddress
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            //to convert the pointer to the appropriate type.
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        //indicates the reachability status of the network.
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
    }
}
