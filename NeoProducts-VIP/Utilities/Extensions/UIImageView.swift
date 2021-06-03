 

import Foundation
import UIKit
import SDWebImage
extension  UIImageView {
    /*
     * Method name: loadImage
     * Description: use to load image from url
     * Parameters: strURL refer url and placeHolder refer placehoder image name
     * Return:  -
     */
    func loadImage(strURL:String?, placeHolder:String) {
        if var url = strURL?.trimmed {
            url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
             self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: placeHolder),options: .refreshCached, completed: { image, error, cacheType, imageURL in
                if image != nil {
                    self.backgroundColor = UIColor.clear
                }
            })
        } else {
            self.image = UIImage(named: placeHolder)
        }
    }
}
