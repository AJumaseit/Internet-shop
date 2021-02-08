import UIKit

protocol ViewConrollerDelegate {
    func getCat() -> ([Product])
    func setId(_ id: Int)
    func eraseData()
}

class ViewController: UIViewController {

    var products: [Product] = []
    var cart: [Product] = []
    
    @IBOutlet weak var mySgmentedCotrol: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "MyTableViewCell" , bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
    }

    @IBAction func switchViews(_ sender: Any) {
        myCollectionView.isHidden = !myCollectionView.isHidden
        myTableView.isHidden = !myTableView.isHidden
        print(myCollectionView.isHidden)
        print(myTableView.isHidden)
    }
    
    @IBAction func goToCart(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CartViewController") as! CartViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadData() {
        products.append(Product(id: 0, title: "Pistachio Coffee Frappuccino", decription: "Sweet pistachio flavor blended with coffee, milk, and ice, then finished with whipped cream and a rich, salted brown-buttery topping—an icy-smooth, creamy delight to keep you energized in the new year.", price: 1200, image: "1.jpg"))
        products.append(Product(id: 1, title: "Caramel Brulée Frappuccino", decription: "Espresso, milk and ice blended with rich caramel brulée sauce, and then topped with whipped cream and more rich sauce for extra-gooey goodness.", price: 1300, image: "2.jpg"))
        products.append(Product(id: 2, title: "Chestnut Praline Frappuccino", decription: "Here the festive flavors of caramelized chestnuts and spices blended with Frappuccino® Roast coffee, milk and ice, and then topped with whipped cream and spiced praline crumbs, create a blissful world of deliciousness.", price: 1400, image: "3.jpg"))
        products.append(Product(id: 3, title: "Peppermint Mocha Frappuccino", decription: "A delectable blend of chocolate-pepperminty perfection in every cool sip—Frappuccino® Roast coffee, mocha sauce, peppermint-flavored syrup, milk and ice, topped with whipped cream and dark chocolate curls.", price: 1500, image: "4.jpg"))
        products.append(Product(id: 4, title: "Peppermint White Chocolate Mocha Frappuccino", decription: "A delectable blend of chocolate-pepperminty perfection in every cool sip—Frappuccino® Roast coffee, mocha sauce, peppermint-flavored syrup, milk and ice, topped with whipped cream and dark chocolate curls.", price: 1600, image: "5.jpg"))
        products.append(Product(id: 5, title: "Toasted White Chocolate Mocha Frappuccino", decription: "A toasty holiday blend of wonder: Frappuccino® Roast coffee, milk, ice and flavors of caramelized white chocolate with a cheerful topping of whipped cream, festive holiday sugar sparkles and crispy white pearls.", price: 1700, image: "6.jpg"))
        products.append(Product(id: 6, title: "Mocha Cookie Crumble Frappuccino", decription: "Frappuccino® Roast coffee, mocha sauce and Frappuccino® chips blended with milk and ice, layered on top of whipped cream and chocolate cookie crumble and topped with vanilla whipped cream, mocha drizzle and even more chocolate cookie crumble. Each sip is as good as the last . . . all the way to the end.", price: 1800, image: "7.jpg"))
        products.append(Product(id: 7, title: "Caramel Ribbon Crunch Frappuccino", decription: "Buttery caramel syrup blended with coffee, milk and ice, then topped with a layer of dark caramel sauce, whipped cream, caramel drizzle and a crunchy caramel-sugar topping—oh-so-beautifully delicious.", price: 1900, image: "8.jpg"))
        products.append(Product(id: 8, title: "Espresso Frappuccino", decription: "Coffee is combined with a shot of espresso and milk, then blended with ice to give you a nice little jolt and lots of sipping joy.", price: 2000, image: "9.jpg"))
        products.append(Product(id: 9, title: "Caffè Vanilla Frappuccino", decription: "We take Frappuccino® roast coffee and vanilla bean powder, combine them with milk and ice, topped with whipped cream. Tastes like happiness.", price: 2100, image: "10.jpg"))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        let product = products[indexPath.row]
        cell.myImageView.image = UIImage(named: product.image!)
        cell.myTableLabel.text = product.title
        cell.myDescriptionLabel.text = product.decription
        cell.myPriceLabel.text = "\(product.price ?? -1) T"
        cell.delegate = self
        cell.id = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "InfoViewController") as! InfoViewController
        let product = products[indexPath.row]
        vc.product = product
        vc.delegate = self
        vc.id = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return products.count
}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        let product = products[indexPath.row]
        cell.myImageView.image = UIImage(named: product.image!)
        cell.myTitleLabel.text = product.title
        cell.myDescriptionLabel.text = product.decription
        cell.myPriceLabel.text = "\(product.price ?? -1) T"
        cell.delegate = self
        cell.id = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "InfoViewController") as! InfoViewController
        let product = products[indexPath.row]
        vc.product = product
        vc.delegate = self
        vc.id = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.width/2, height: 180)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController: ViewConrollerDelegate {
    func eraseData() {
        cart = []
    }
    
    func setId(_ id: Int) {
        cart.append(products[id])
    }
    
    func getCat() -> ([Product]) {
        return cart
    }
    
}
