//
//  DataModel.swift
//  dtapi
//
//  Created by Volodymyr on 10/17/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class DataModel: NSObject {

    struct Speciality {
        let specialityId: String
        let specialityName: String
        let specialityCode: String
    }
    init(json: [Any]) {
        specialityId = json["speciality_id"] as? String
        specialityName = json["speciality_name"] as? String
        specialityCode = json["speciality_code"] as? String
    }
    
}
