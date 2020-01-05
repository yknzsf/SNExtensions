//
//  UIImageExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/3/17.
//  Copyright © 2017年 zsf. All rights reserved.
//

import UIKit

public extension UIImage {
    
    func tintedImage() -> UIImage {
        return self.withRenderingMode(.alwaysTemplate);
    }
    
    func croppedImage(bound: CGRect) -> UIImage? {
        guard self.size.width > bound.origin.x else {
            print("Your cropping bound X coordinate is larger than the image width")
            return nil
        }
        guard self.size.height > bound.origin.y else {
            print("Your cropping bound Y coordinate is larger than the image height")
            return nil
        }
        let scaledBounds: CGRect = CGRect(x: bound.origin.x * self.scale, y: bound.origin.y * self.scale, width: bound.size.width * self.scale, height: bound.size.height * self.scale);
        
        if let imageRef = self.cgImage?.cropping(to: scaledBounds) {
            let croppedImage: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: .up);
            return croppedImage
        }
        
        return nil;
    }
    
    //  Rotate image with 90 degree
    func rotateImageToNighntyDegree() -> UIImage {
        let image =  UIImage(cgImage: self.cgImage!, scale:1, orientation: .leftMirrored)
        return UIImage(cgImage: image.cgImage!, scale:1, orientation: .leftMirrored)
    }
    
    func addToRight(image: UIImage) -> UIImage? {
        
        if image.size.height <= 0.0 {
            return self;
        }
        let imageWidth = (self.size.height / image.size.height) * image.size.width;
        
        let size = CGSize(width: self.size.width + imageWidth, height: self.size.height);
        UIGraphicsBeginImageContext(size);
        
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height));
        image.draw(in: CGRect(x: self.size.width, y: 0, width: imageWidth, height: self.size.height));
        
        let resultingImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        return resultingImage;
    }
    
    func addToBottom(image: UIImage) -> UIImage? {
        
        if image.size.width <= 0.0 {
            return self;
        }
        
        let imageHeight = (self.size.width / image.size.width) * image.size.height;
        
        let size = CGSize(width: self.size.width, height: imageHeight + self.size.height);
        UIGraphicsBeginImageContext(size);
        
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height));
        image.draw(in: CGRect(x: 0, y: self.size.height, width: self.size.width, height: imageHeight));
        
        let resultingImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        return resultingImage;
    }
}
