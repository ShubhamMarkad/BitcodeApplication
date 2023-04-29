//
//  EnquiryDetailsViewController.swift
//  BitcodeApplication
//
//  Created by Mac on 19/04/23.
//

import UIKit

class EnquiryDetailsViewController: UIViewController {
    var enquiryViewController : EnquiryViewController?
    var students : [Student] = []
    @IBOutlet weak var studentDetailsTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        studentDetailsTabelView.dataSource = self
        studentDetailsTabelView.delegate = self
         registerWithXIB()
    }
    @IBAction func add_Btn(_ sender: Any) {
        enquiryViewController = self.storyboard?.instantiateViewController(withIdentifier: "EnquiryViewController")as?EnquiryViewController
        enquiryViewController?.delegate = self
        navigationController?.pushViewController(enquiryViewController!, animated: true)
    }
    func registerWithXIB(){
        let uiNib = UINib(nibName:"StudentTableViewCell", bundle: nil)
        self.studentDetailsTabelView.register(uiNib, forCellReuseIdentifier: "StudentTableViewCell")
    }
}
extension EnquiryDetailsViewController : BackDataPassing{
    func sendDataToSecondViewController(student: Student) {
        students.append(student)
        self.studentDetailsTabelView.reloadData()
    }
}
extension EnquiryDetailsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTabelViewCell = self.studentDetailsTabelView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as? StudentTableViewCell
        studentTabelViewCell?.firstNameLabel.text = String(students[indexPath.row].firstName)
        studentTabelViewCell?.lastNameLabel.text = String(students[indexPath.row].lastName)
        studentTabelViewCell?.phoneNumberLabel.text = String(students[indexPath.row].phoneNumber)
        studentTabelViewCell?.yearOfPassingLabel.text = String(students[indexPath.row].passingYear)
        studentTabelViewCell?.quelificationlabel.text = String(students[indexPath.row].qualification)
        return studentTabelViewCell ?? UITableViewCell()
}
}
extension EnquiryDetailsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
        }
        
    }
}
