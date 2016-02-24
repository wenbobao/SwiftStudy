//
//  XHAlbum.swift
//  AlamofireSwiftyJSONTest
//
//  Created by bob on 16/2/24.
//  Copyright © 2016年 __company__. All rights reserved.
//

import Foundation
import ObjectMapper

class XHAlbumResponse: Mappable {
    
    var total: Int?
    var albums: [XHAlbum]?
    var code: Int?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        total <- map["total"]
        albums <- map["albums"]
        code <- map["code"]

    }
    
}

class XHAlbum: Mappable {
    
    var songID: Int?
    var songName: String?
    var songPicUrl: String?
    var songBlurPicUrl: String?
    var artist: XHArtist?
    var publishTime: String?
    var company: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        songID <- map["id"]
        songName <- map["name"]
        songPicUrl <- map["picUrl"]
        songBlurPicUrl <- map["blurPicUrl"]
        artist <- map["artist"]
        publishTime <- map["publishTime"]
        company <- map["company"]
        
    }
    
}

class XHArtist: Mappable {
    
    var artistID: Int?
    var artistName: String?
    var artistUrl: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        artistID <- map["id"]
        artistName <- map["name"]
        artistUrl <- map["picUrl"]
        
    }
    
}

