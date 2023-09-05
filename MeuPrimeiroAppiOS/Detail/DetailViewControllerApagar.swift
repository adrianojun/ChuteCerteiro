import UIKit

class DetailViewControllerApagar: UIViewController {

    @IBOutlet weak var footballCountryName: UILabel!
    @IBOutlet weak var footballlCountryLogo: UIImageView!
    //@IBOutlet weak var movieRating: UILabel!
    //@IBOutlet weak var movieDescription: UILabel!
    
    var football: Football!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        footballlCountryLogo.layer.cornerRadius = 8
        footballlCountryLogo.layer.masksToBounds = true
        footballlCountryLogo.contentMode = .scaleAspectFill
        footballlCountryLogo.backgroundColor = .blue

        configure(with: football)
    }

    func configure(with football: Football) {
        footballCountryName.text = football.countryName
        footballlCountryLogo.download(path: football.countryLogo)
        //movieRating.text = "Classificação: \(football.voteAverage)"
        //movieDescription.text = football.overview
    }
}
