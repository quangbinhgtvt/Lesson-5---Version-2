//
//  DetailCategoryViewController.swift
//  Lesson 5 - Version 2
//
//  Created by BinhPQ on 10/23/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class DetailCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //outlets & var
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var detailSearchBar: UISearchBar!
    @IBOutlet weak var detailCategoryTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTableView()

        // Do any additional setup after loading the view.
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeTableView(){
        self.detailCategoryTableView.delegate = self
        self.detailCategoryTableView.dataSource = self
        self.detailCategoryTableView.register(UINib(nibName: "DetailCategoryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "detailCategoryCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "detailCategoryCell", for: indexPath) as! DetailCategoryTableViewCell
        cell.detailLabel?.text = " I am very handsome"
    
        return cell
    }
}
