//
//  MenuViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 10/3/21.
//

import UIKit

enum MenuButtonType: Int {
    case home
    case howTo
    case about
}

class MenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    
    var didTapMenuType: ((MenuButtonType) -> Void)?
    
    // info, lightbulb, info.circle, questionmark
    var cellImages: [String] = ["house.fill", "questionmark","square.text.square"]
    var cellTitles: [String] = ["Encryptor", "How To Use", "About"]
    
    var visibleInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView = segue.destination as? ViewController
        
        destinationView?.visibleViewInt = visibleInt
    }
    

}


extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        
        cell.configureCellViews(imageName: cellImages[indexPath.row], text: cellTitles[indexPath.row])
        let cellHeightAnchor = cell.contentView.heightAnchor.constraint(equalToConstant: view.frame.height/7)
        cellHeightAnchor.priority = UILayoutPriority(rawValue: 999)
        cellHeightAnchor.isActive = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let buttonType = MenuButtonType(rawValue: indexPath.row) else { return}
        dismiss(animated: true) { [weak self] in
//            print("dismissing\(buttonType)")
            self?.didTapMenuType?(buttonType)
        }
        
    }
    
    
}
