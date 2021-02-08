import UIKit

class InfoViewController: UIViewController {
    
    var id = -1
    var delegate: ViewConrollerDelegate?
    var product: Product?

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTitleLabel: UILabel!
    @IBOutlet weak var myDescriptionLabel: UILabel!
    @IBOutlet weak var myPriceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = UIImage(named: (product?.image)!)
        myTitleLabel.text = product?.title
        myDescriptionLabel.text = product?.decription
        myPriceLabel.text = "\(product?.price ?? -1) T"
    }
    @IBAction func addToCart(_ sender: Any) {
        delegate?.setId(id)
    }
}
