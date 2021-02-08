import UIKit

class CartViewController: UIViewController {
    
    var cart: [Product] = []
    var delegate: ViewConrollerDelegate?

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cart = (delegate?.getCat())!
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil) , forCellReuseIdentifier: "MyTableViewCell")
        myTableView.tableFooterView = UIView()
    }
    @IBAction func buyProducts(_ sender: Any) {
        let alert = UIAlertController(title: "Thanks", message: "Please come back!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            self.cart = []
            self.delegate?.eraseData()
            self.myTableView.reloadData()
        }))
        self.present(alert, animated: true, completion: nil)
    }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cart.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
    let item = cart[indexPath.row]
    cell.myImageView.image = UIImage(named: item.image!)
    cell.myTableLabel.text = item.title
    cell.myDescriptionLabel.text = item.decription
    cell.myPriceLabel.text = "\(item.price ?? -1) T"
    cell.myAddToCartButton.isHidden = true
    return cell
}

}
