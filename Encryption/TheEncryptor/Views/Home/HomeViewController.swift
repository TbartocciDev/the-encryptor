//
//  HomeViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/27/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var subHeaderLbl: UILabel!
    @IBOutlet weak var pagesTableView: UITableView!
    
    let pages = [
        PageListItem(title: "Encryptor", iconName: "exclamationmark.lock"),
        PageListItem(title: "How To Use", iconName: "questionmark.square.dashed"),
        PageListItem(title: "About", iconName: "square.text.square")
    ]
    
    var nextView = "encryptor"
    let backBtn = UIImage(systemName: "line.3.horizontal")

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.styleNavBar(title: "", imgName: "line.3.horizontal", color: .black)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pagesTableView.deselectRow(at: pagesTableView.indexPathForSelectedRow ?? IndexPath(row: 0, section: 0), animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            let destination = segue.destination as! MainViewController
            destination.selectedView = nextView
        }
    }
    
    func styleNavBar() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.backIndicatorImage = backBtn
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBtn
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func setUpTableView(){
        pagesTableView.delegate = self
        pagesTableView.dataSource = self
        pagesTableView.separatorStyle = .none
        pagesTableView.isScrollEnabled = false
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PageCell") as! PageListItemCell
        cell.configureCell(title: pages[indexPath.row].title, icon: pages[indexPath.row].iconName)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return round(view.frame.height / 10)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.subviews.forEach({ view in
            view.flash(duration: 0.03)
        })
        if indexPath.row == 0 {
            nextView = "Encryptor"
        } else if indexPath.row == 1 {
            nextView = "How To Use"
        } else {
            nextView = "About"
        }
        return indexPath
    }
    
}
