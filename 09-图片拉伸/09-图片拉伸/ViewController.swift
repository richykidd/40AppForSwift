//
//  ViewController.swift
//  09-图片拉伸
//
//  Created by Richy Li on 16/12/21.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "steve"))
        setupScrollView()
        scrollView.delegate = self
        
        setZoomScaleFor(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setZoomScaleFor(scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale{
        scrollView.zoomScale = scrollView.minimumZoomScale
        }
        recenterImage()
    }
    
   fileprivate func setupScrollView(){
    
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
    
    }
  fileprivate  func setZoomScaleFor(_ srollViewSize: CGSize){
    
        let imageSize = imageView.bounds.size
        let widthScale = srollViewSize.width / imageSize.width
        let heighScale = srollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heighScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3
        
    }
  fileprivate  func recenterImage(){
    
    let scrollViewSize = scrollView.bounds.size
    let imageViewSize = imageView.frame.size
    let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
    let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
    
    scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
    
    
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
  
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.recenterImage()
    }

}

