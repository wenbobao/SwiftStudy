//
//  ViewController.swift
//  AlamofireSwiftyJSONTest
//
//  Created by bob on 16/2/24.
//  Copyright © 2016年 __company__. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        Alamofire.request(.GET,"http://music.163.com/api/album/new", parameters: ["area":"ALL","offset":"0","total":"true","limit":"5"], headers: ["Referer":"http://music.163.com"])
//            .validate()
//            .responseJSON { response in
//            print(response.result)
//                switch response.result{
//                case .Success:
//                    if let value = response.result.value {
//                        let json = JSON(value)
//                        print("JSON: \(json)")
//                        print(json["albums"][0]["picUrl"])
//                        print(json["albums"][0]["id"])
//                        print(json["albums"][0]["name"])
//                        let album = Mapper<XHAlbum>().map(json["albums"][0].dictionaryObject)
//                        print(album?.songID)
//                        print(album?.songName)
//                        print(album?.artist?.artistName)
//                    }
//                case .Failure(let error):
//                    print(error)
//                }
//        }
        
        
        Alamofire.request(.GET,"http://music.163.com/api/album/new", parameters: ["area":"ZH","offset":"0","total":"true","limit":"50"], headers: ["Referer":"http://music.163.com"])
            .validate()
            .responseJSON {response in
                switch response.result{
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        
                       let albums = Mapper<XHAlbumResponse>()
                                        .map(json.dictionaryObject)
                        for (index, album) in (albums?.albums?.enumerate())!{
                            print("index: \(index),songName: \(album.songName)")
                        }
                    }
                case .Failure(let error):
                    print(error)
                }

            }
    }


}

