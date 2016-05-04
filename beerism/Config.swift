//
//  Config.swift
//  beerism
//
//  Created by Kong Mono on 4/29/16.
//  Copyright © 2016 beerism. All rights reserved.
//

import Foundation


struct Config {
    static let apiKey = "1234ABCD"
    static let googleAnalyticsToken = "12321-312-1238388"
    static let maxConnections = 10
}

struct API {
    static let event_service = "http://128.199.228.8/craftbeer/api/events/all/status/coming/format/json"
}

struct BeerismColor {
    static let colorPrimary = "#3F51B5"
    static let colorPrimaryDark = "#ff9800"
    static let colorAccent = "#FF4081"
}