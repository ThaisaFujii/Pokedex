//
//  ViewController.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 28/07/22.
// https://www.hackingwithswift.com/books/ios-swiftui/wrapping-a-uiviewcontroller-in-a-swiftui-view

import Foundation
import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
            imageView.image = UIImage(named: "logo")
    return imageView
}()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        
        // Do any additiona lsetup after loading the new view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: { self.animate()
            
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 1.5
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size)
        })
    }
}
