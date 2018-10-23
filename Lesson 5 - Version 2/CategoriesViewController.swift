//
//  CategoriesViewController.swift
//  Lesson 5 - Version 2
//
//  Created by BinhPQ on 10/22/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var CategoriesCollectionView: UICollectionView!
    var img: [String] = ["ic_community", "ic_housing", "ic_job", "ic_personal", "ic_sale", "ic_forum"]
    var imagName: [String] = ["Community", "Housing", "Jobs", "Personal", "For Sale", "Discussion Forum"]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeCollectionView()
        
        // Do any additional setup after loading the view.
    }

    private func customizeCollectionView(){
        self.CategoriesCollectionView.delegate = self
        self.CategoriesCollectionView.dataSource = self
        self.CategoriesCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CategoryCell")
        self.CategoriesCollectionView.register(UINib(nibName: "CategoryHeaderCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CategoryHeaderCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            // return headd cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryHeaderCell", for: indexPath) as! CategoryHeaderCollectionViewCell
            cell.CountryLabelHeaderCell.text = "United Kingdom"
            cell.CityLabelHeaderCell.text = " Manchester United"
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
            cell.imageCollectionViewCell.image = UIImage(named: img[indexPath.row - 1])
            cell.categoryItemLabel.text = imagName[indexPath.row - 1]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let spacing : CGFloat = 15.0
        
        switch indexPath.row {
        case 0:
            //return header size
        let headerWidth: CGFloat = screenWidth - (spacing * 2)
          return CGSize(width: headerWidth, height: 80)
        default:
            let itemWidth: CGFloat = (screenWidth - spacing * 3)/2
            return CGSize(width: itemWidth, height: itemWidth)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    //moveto Detaile Category View
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let detailCategoryView = DetailCategoryViewController(nibName: "DetailCategoryViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(detailCategoryView, animated: true)
    }
}
