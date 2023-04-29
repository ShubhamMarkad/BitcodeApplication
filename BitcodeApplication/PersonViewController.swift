//
//  PersonViewController.swift
//  BitcodeApplication
//
//  Created by Mac on 19/04/23.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var personCollectionView: UICollectionView!
    @IBOutlet weak var personTableView: UITableView!
    var personTableViewCell : PersonTableViewCell?
    var personCollectionViewCell : PersonCollectionViewCell?
    var person = ["Shubham","Rohan","Yuvraj","Sachin","Tushar"]
    var personImage = ["Shubham","Rohan","Yuvraj","Sachin","Tushar"]
    override func viewDidLoad() {
        super.viewDidLoad()
        personTableView.delegate = self
        personTableView.dataSource = self
        personCollectionView.delegate = self
        personCollectionView.dataSource = self
        registerWithXIB()
    }
    func registerWithXIB(){
        var uiNib = UINib(nibName: "PersonTableViewCell", bundle: nil)
        self.personTableView.register(uiNib, forCellReuseIdentifier: "PersonTableViewCell")
        var uiNib1 = UINib(nibName: "PersonCollectionViewCell", bundle: nil)
        self.personCollectionView.register(uiNib1, forCellWithReuseIdentifier: "PersonCollectionViewCell")
    }
//    func registerWithXIBCollectionView(){
//
//    }
   
}
extension PersonViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        300.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //personTableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
        if let personDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "PersonDetailsViewController")as?PersonDetailsViewController{
            personDetailsViewController.name = person[indexPath.row]
            personDetailsViewController.image = UIImage(named: personImage[indexPath.row])!
            self.navigationController?.pushViewController(personDetailsViewController, animated: true)
        }
    }
}
extension PersonViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        person.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        personTableViewCell = self.personTableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath)as?PersonTableViewCell
        personTableViewCell?.personImageView.image = UIImage(named: personImage[indexPath.row])
        personTableViewCell?.personNameLabel.text = person[indexPath.row]
        return personTableViewCell ?? UITableViewCell()
    }
    
    
}
extension PersonViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return person.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView,  cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        personCollectionViewCell = self.personCollectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath)as?PersonCollectionViewCell
        personCollectionViewCell?.imageView.image = UIImage(named: personImage[indexPath.row])
        personCollectionViewCell?.nameLabel.text = person[indexPath.row]
        return personCollectionViewCell ?? UICollectionViewCell()
        
    }
    
    
}
extension PersonViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewheight = view.frame.size.height
        let viewwidth = view.frame.size.width
        return CGSize(width: viewwidth * 0.90, height:viewheight * 0.40)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let personDetailsViewController = storyboard?.instantiateViewController(withIdentifier:"PersonDetailsViewController")as?PersonDetailsViewController{
            personDetailsViewController.name = person[indexPath.row]
            personDetailsViewController.image = UIImage(named: personImage[indexPath.row])!
            self.navigationController?.pushViewController(personDetailsViewController, animated: true)
            
        }
    }
    
}
