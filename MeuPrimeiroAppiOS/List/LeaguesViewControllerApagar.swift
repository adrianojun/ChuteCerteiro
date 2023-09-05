import UIKit

class LeaguesViewControllerApagar: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var leagues: [Football] = []
    private var countryName: String
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()

    init(countryName: String) {
        self.countryName = countryName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchRemoteLeagues()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchRemoteLeagues() {
        guard let url = URL(string: "https://apifootball.com/api/?action=get_leagues&country=\(countryName)&APIkey=fe56acd2acb45d94a9f1331149dc55aa2846896f38ecf1484de36d6a3cea87f0") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let leaguesData = try decoder.decode([FootballLeague].self, from: data)
                self.leagues = leaguesData

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
    }
    
    // Implement UITableViewDataSource and UITableViewDelegate methods
}

//extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = MovieCell()
        //let movie = movies[indexPath.row]
        //cell.configure(movie: movie)
        //return cell
    //}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedMatch = matches[indexPath.row]
    let leaguesViewController = LeaguesViewController(countryName: selectedMatch.country)
    navigationController?.pushViewController(leaguesViewController, animated: true)
}

//}
