 

import Foundation
import UIKit
struct Theme {
    struct Colors {
        static  let blackColor = UIColor.black
        static  let whiteColor = UIColor.white
        static  let drakGray = UIColor.darkGray
        static  let lightGray = UIColor.lightGray
        static  let redColor = UIColor.red
    }
    
    struct Font {
        
        private static func mediumFont (_ size: CGFloat) -> UIFont? {
            return UIFont(name: "HelveticaNeue-Medium", size: size)}
        
        private static func lightFont (_ size: CGFloat) -> UIFont? {
            return  UIFont(name: "HelveticaNeue-Light", size: size)}
        
        private static func boldFont (_ size: CGFloat) -> UIFont? {
            return UIFont(name: "HelveticaNeue-Bold", size: size)}
        
        private static func regularFont (_ size: CGFloat) -> UIFont? {
            return  UIFont(name: "HelveticaNeue-Regular", size: size)}
        
        static  let boldXXLLarge = boldFont(FontSizes.XXL)
        static  let lightdXXLLarge = lightFont(FontSizes.XXL)
        static  let mediumXXLLarge = mediumFont(FontSizes.XXL)
        static  let regulardXXLLarge = regularFont(FontSizes.XXL)
        
        //extraLarge 32
        static  let boldExtraLarge = boldFont(FontSizes.extraLarge)
        static  let lightExtraLarge = lightFont(FontSizes.extraLarge)
        static  let mediumExtraLarge = mediumFont(FontSizes.extraLarge)
        static  let regularExtraLarge = regularFont(FontSizes.extraLarge)
        
        //Large 29
        static  let boldLarge = boldFont(FontSizes.large)
        static  let lightLarge = lightFont(FontSizes.large)
        static  let mediumLarge = mediumFont(FontSizes.large)
        static  let regularLarge = regularFont(FontSizes.large)
        
        
        //Title 1 26
        static  let lightTitle1 = lightFont(FontSizes.title1)
        static  let mediumTitle1  = mediumFont(FontSizes.title1)
        static  let boldTitle1  = boldFont(FontSizes.title1)
        static  let regularTitle1  = regularFont(FontSizes.title1)
        
        
        //Title 2 23
        static  let lightTitle2 = lightFont(FontSizes.title2)
        static  let mediumTitle2  = mediumFont(FontSizes.title2)
        static  let boldTitle2  = boldFont(FontSizes.title2)
        static  let regularTitle2  = regularFont(FontSizes.title2)
        
        
        //Title 3 20
        static  let lightTitle3 = lightFont(FontSizes.title3)
        static  let mediumTitle3  = mediumFont(FontSizes.title3)
        static  let boldTitle3  = boldFont(FontSizes.title3)
        static  let regularTitle3  = regularFont(FontSizes.title3)
        
        
        //Headline 18
        static  let lightHeadline = lightFont(FontSizes.headline)
        static  let mediumHeadline = mediumFont(FontSizes.headline)
        static  let boldHeadline = boldFont(FontSizes.headline)
        static  let regularHeadline = regularFont(FontSizes.headline)
        
        
        //Body 16
        static  let lightBody = lightFont(FontSizes.body)
        static  let mediumBody = mediumFont(FontSizes.body)
        static  let boldBody = boldFont(FontSizes.body)
        static  let regularBody = regularFont(FontSizes.body)
        
        
        //Callout 14
        static  let lightCallout  = lightFont(FontSizes.callout)
        static  let mediumCallout = mediumFont(FontSizes.callout)
        static  let boldCallout = boldFont(FontSizes.callout)
        static  let regularCallout = regularFont(FontSizes.callout)
        
        
        //Subheads 12
        static  let lightSubheads = lightFont(FontSizes.subheads)
        static  let mediumSubheads = mediumFont(FontSizes.subheads)
        static  let boldSubheads  = boldFont(FontSizes.subheads)
        static  let regularSubheads = regularFont(FontSizes.subheads)
        
        //Caption1 10
        static  let lightCaption1 = lightFont(FontSizes.caption1)
        static  let mediumCaption1 = mediumFont(FontSizes.caption1)
        static  let boldCaption1  = boldFont(FontSizes.caption1)
        static  let regularCaption1 = regularFont(FontSizes.caption1)
        
        //Caption2 8
        static  let lightCaption2 = lightFont(FontSizes.caption2)
        static  let mediumCaption2 = mediumFont(FontSizes.caption2)
        static  let boldCaption2  = boldFont(FontSizes.caption2)
        static  let regularCaption2 = regularFont(FontSizes.caption2)
    }
    
    
    private struct FontSizes {
        
        static let XXL : CGFloat = getFontSize(size: 55)
        static let extraLarge : CGFloat = getFontSize(size: 38.0)
        static let large : CGFloat = getFontSize(size: 30.0)
        static let title1 : CGFloat = getFontSize(size: 26.0)
        static let title2 : CGFloat = getFontSize(size: 23.0)
        static let title3 : CGFloat = getFontSize(size: 20.0)
        static let headline : CGFloat = getFontSize(size: 18.0)
        static let body : CGFloat = getFontSize(size: 16.0)
        static let callout : CGFloat = getFontSize(size: 14.0)
        static let subheads : CGFloat = getFontSize(size: 12.0)
        static let caption1 : CGFloat = getFontSize(size: 10.0)
        static let caption2 : CGFloat = getFontSize(size: 8.0)
       
        static func getFontSize(size:CGFloat)-> CGFloat{
            
            let width = Int(UIScreen.main.bounds.width)
            switch width {
            case 0...320:
                return size
            case 375:
                return size + 1.0
            default:
                return size + 2.0
            }
        }
    }
    
    static func getFontSize(size:CGFloat)-> CGFloat{
        
        let width = Int(UIScreen.main.bounds.width)
        switch width {
        case 0...320:
            return size
        case 375:
            return size + 1.0
        default:
            return size + 2.0
        }
    }
}
