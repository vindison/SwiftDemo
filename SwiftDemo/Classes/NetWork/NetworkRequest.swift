//
//  NetworkRequest.swift
//  SwiftDemo
//
//  Created by Vindison on 2017/8/30.
//  Copyright © 2017年 Vindison. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private let NetworkRequestShareInstance = NetworkRequest()

class NetworkRequest {
    class var sharedInstance : NetworkRequest {
        return NetworkRequestShareInstance
    }
}

extension NetworkRequest {
    func getRequest(urlString: String, papameters : [String : Any]?, success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        let url = "http://postest.efengshe.com/" + urlString
        Alamofire.request(url, method: .get, parameters: papameters)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    success(value as! [String : AnyObject])
                    let json = JSON(value)
                    print(json)
                case .failure(let error):
                    failture(error)
                    print("error:\(error)")
                }
        }
    }
    
    func postRequest(urlString : String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        Alamofire.request(urlString, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
                    let json = JSON(value)
                    print(json)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
        }
    }
    
    //MARK: - 照片上传
    //
    // - Parameters:
    // - urlString: 服务器地址
    // - params: ["flag":"","userId":""] - flag,userId 为必传参数
    // flag - 666 信息上传多张  －999 服务单上传  －000 头像上传
    // - data: image转换成Data
    // - name: fileName
    // - success:
    // - failture:
    func upLoadImageRequest(urlString : String, params:[String:String], data: [Data], name: [String],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        
        let headers = ["content-type":"multipart/form-data"]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                //666多张图片上传
                let flag = params["flag"]
                let userId = params["userId"]
                
                multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "flag")
                multipartFormData.append( (userId?.data(using: String.Encoding.utf8)!)!, withName: "userId")
                
                for i in 0..<data.count {
                    multipartFormData.append(data[i], withName: "appPhoto", fileName: name[i], mimeType: "image/png")
                }
        },
            to: urlString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            success(value)
                            let json = JSON(value)
                            print(json)
                        }
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    failture(encodingError)
                }
        }
        )
    }
}
