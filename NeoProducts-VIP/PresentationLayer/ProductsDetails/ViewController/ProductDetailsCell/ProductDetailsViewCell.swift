import UIKit
class ProductDetailsViewCell: UITableViewCell {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productManufacturer: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    
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
        productName.font = Theme.Font.boldHeadline
        productManufacturer.font = Theme.Font.regularBody
        productPrice.font = Theme.Font.mediumBody
        productRating.font = Theme.Font.mediumBody
        productDesc.font = Theme.Font.regularCallout
        
        productName.textColor = Theme.Colors.blackColor
        productManufacturer.textColor = Theme.Colors.drakGray
        productPrice.textColor = Theme.Colors.redColor
        productRating.textColor = Theme.Colors.redColor
        productDesc.textColor = Theme.Colors.drakGray
    }
    
    // MARK: - setup product data
    /*
     * Method name: setProductData
     * Description: use to set data to outlets
     * Parameters: product object
     * Return:  -
     */
    func setProductData(product:ProductDetails?) {
        if let product = product {
            productName.text = product.name
            productManufacturer.text = product.producer
            productPrice.text = "Rs. \(product.cost ?? 0)"
            productRating.text = "Rating \(product.rating ?? 0)"
            productDesc.text =  product.descriptionField
        }
    }
}
