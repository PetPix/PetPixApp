//
//  Post.swift
//  PetPix
//
//  Created by Summer on 4/6/24.
//

import Foundation
import ParseSwift
import CoreLocation

struct Post: ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var caption: String?
    var username: String?
//    var user: User?
    var imageFile: ParseFile?
//    var imageLocation: CLLocation?
    //todo: CLLocation is not decodeable, fix! possible custom decoder?
}


