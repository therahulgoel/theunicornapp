//
//  HomeViewController.swift
//  TheUnicornApp
//
//  Created by Rahul Goel on 26/07/21.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet weak var tblView: UITableView!
    let vm:HomeViewModel = HomeViewModel(HomeAPIManager())

    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        vm.fetchNews()
        tblView.rowHeight = UITableView.automaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeViewController:HomeViewModelDelegate{
    func reloadData(){
        tblView.reloadData()
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getTotalLatestNews()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = vm.getLatestNews()[indexPath.row].title
        return cell
    }
    
    
}

