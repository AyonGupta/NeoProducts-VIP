import UIKit
class ProductListViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productManufacturer: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productFavImage: UIImageView!
    @IBOutlet weak var productFavButton: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        setFont()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - set font
    /*
     * Method name: setFont
     * Description: use to set font to outlets
     * Parameters: -
     * Return:  -
     */
    func setFont() {
        productName.font = Theme.Font.mediumBody
        productManufacturer.font = Theme.Font.mediumSubheads
        productPrice.font = Theme.Font.boldHeadline
        
        productName.textColor = Theme.Colors.blackColor
        productManufacturer.textColor = Theme.Colors.drakGray
        productPrice.textColor = Theme.Colors.redColor
        
    }
    
    // MARK: - setup product data
    /*
     * Method name: setProductData
     * Description: use to set data to outlets
     * Parameters: product object
     * Return:  -
     */
    func setProductData(product:Product) {
        productName.text = product.product_name
        productManufacturer.text = product.product_producer
        productPrice.text = "Rs. \(product.product_cost ?? 0)"
        productImage.loadImage(strURL: product.product_Image, placeHolder: ImageConstant.placeholder)
    }
    
    /*
     * Method name: setProductFavImage
     * Description: use to set data to outlets
     * Parameters: product object
     * Return:  -
     */
    func setFavoriteImage(isFav:Bool) {
        productFavImage.image = UIImage(named: isFav ? ImageConstant.favImage : ImageConstant.unFavImage)
    }
}
