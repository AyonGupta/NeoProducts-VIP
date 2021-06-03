//
//  ImageGalleryView.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import UIKit
class ImageGalleryView: UIView, UIScrollViewDelegate {
    
    @IBOutlet weak var sliderScrollView: UIScrollView!
    @IBOutlet weak var sliderPageControl: UIPageControl!
    @IBOutlet weak var bannerImageView: UIImageView!
    var banners = [String]()
    private static let nibName = "ImageGalleryView"
    var count = 0
    
    static func loadView() -> ImageGalleryView? {
        guard let view = Bundle.main
                .loadNibNamed(nibName, owner: self, options: nil)?[0]
                as? ImageGalleryView else {
            return nil
        }
        
        return view
    }
    
    func addImageView(scrollImageArray: [String]){
        banners = scrollImageArray
        sliderScrollView.subviews.forEach ({ ($0 as? UIImageView)?.removeFromSuperview() })
        sliderScrollView.delegate = self
        if #available(iOS 11.0, *) {
            sliderScrollView.contentInsetAdjustmentBehavior = .never
        }
        var x : CGFloat = 0
        var tag = 0
        for strURL in banners{
            let imageView = UIImageView(frame: CGRect(x: x, y: 0, width: bounds.size.width, height: self.frame.size.height))
            imageView.contentMode = .scaleAspectFit
            imageView.loadImage(strURL: strURL, placeHolder: ImageConstant.placeholder)
            
            imageView.clipsToBounds = true
            imageView.backgroundColor = UIColor.clear
            self.sliderScrollView.addSubview(imageView)
            x += bounds.width
            imageView.tag = tag
            tag += 1
        }
        sliderScrollView.contentSize = CGSize(width: CGFloat(banners.count) * bounds.size.width, height: 0)
        sliderPageControl.numberOfPages = banners.count
        setUpSliderScroll()
        bannerImageView.isHidden = banners.count > 0 ? true : false
    }
    
    func setUpSliderScroll(){
        self.bringSubviewToFront(sliderPageControl)
        count = 0
        scrollSlider()
    }
    
    @objc func scrollSlider(){
        
        if banners.count-1 == count {
            count = 0
            sliderScrollView.setContentOffset(CGPoint(x: sliderScrollView.frame.size.width  * CGFloat(count), y: 0), animated: false)
            
        }else{
            sliderScrollView.setContentOffset(CGPoint(x: sliderScrollView.frame.size.width  * CGFloat(count), y: 0), animated: true)
            
        }
        sliderPageControl.currentPage = count
        count = count + 1
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = round(sliderScrollView.contentOffset.x /  sliderScrollView.frame.size.width)
        sliderPageControl.currentPage = Int(page)
        count = sliderPageControl.currentPage
    }
}


