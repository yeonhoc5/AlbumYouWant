//
//  UIImageExtension.swift
//  AlbumYouWant
//
//  Created by yeonhoc5 on 2022/11/21.
//

import UIKit

extension UIImage {
    // MARK: - UIImage+Resize
    func compressTo(_ expectedSizeInMb:Int) -> Data? {
        let sizeInBytes = expectedSizeInMb * 1024 * 1024
        var needCompress:Bool = true
        var imgData:Data?
        var compressingValue:CGFloat = 1.0
        while (needCompress && compressingValue > 0.0) {
            if let data:Data = jpegData(compressionQuality: compressingValue) {
                if data.count < sizeInBytes {
                    needCompress = false
                    imgData = data
                } else {
                    compressingValue -= 0.1
                }
            }
        }

        if let data = imgData {
            if (data.count < sizeInBytes) {
                return data
            }
        }
        return nil
    }
}
