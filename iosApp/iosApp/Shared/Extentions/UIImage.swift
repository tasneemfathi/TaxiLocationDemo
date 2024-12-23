//
//  UIImage.swift
//  iosApp
//
//  Created by tasneem .. on 23/12/2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func tinted(with color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        guard let context = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
            return nil
        }

        // Flip the context vertically
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)

        // Draw the original image
        context.setBlendMode(.normal)
        let rect = CGRect(origin: .zero, size: size)
        context.draw(cgImage, in: rect)

        // Apply the tint color
        context.setBlendMode(.sourceIn)
        context.setFillColor(color.cgColor)
        context.fill(rect)

        // Get the tinted image
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return tintedImage
    }

}
