
//
//  EnquiryViewController.swift
//  BitcodeApplication
//
//  Created by Mac on 19/04/23.
//

import UIKit

class EnquiryViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var firstNametextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var yearofPassingTextField: UITextField!
    @IBOutlet weak var quelificationTextField: UITextField!
    
   // var aleartController = UIAlertController(title: "title", message: "message", preferredStyle:.alert)
    var delegate : BackDataPassing?
    var dataSubmitAlert : UIAlertController?
    var actionSheetAlert : UIAlertAction?
    var uiAleartAction : UIAlertAction?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = false
  }
    @IBAction func submit_btn(_ sender: Any) {

        alertController()
        showAlertBeforeSubmitingData()
       
        let firstName = firstNametextField.text
        let lastName = lastNameTextField.text
        let phonenumber = phoneNumberTextField.text?.codingKey.intValue
        let passingYear = yearofPassingTextField.text?.codingKey.intValue
        let qualification = quelificationTextField.text
        let studentObject = Student(firstName: firstName ?? "Shubham", lastName: lastName ?? "markad", phoneNumber: phonenumber ?? 522,passingYear: passingYear ?? 522, qualification: qualification ?? "BCS")
        guard let delegateEDV = delegate else { return }
        delegateEDV.sendDataToSecondViewController(student: studentObject)
        navigationController?.popViewController(animated: true)
        
    }

func alertController(){
    if let firstName = self.firstNametextField.text,firstName.isEmpty{
    let aleart = UIAlertController(title: "Alert", message: "First Name is empty", preferredStyle:.alert)
    aleart.addAction(UIAlertAction(title: "ok", style: .default,handler: nil))
        present(aleart, animated: true)
    }
    if let lastName = self.lastNameTextField.text,lastName.isEmpty{
        let aleart1 = UIAlertController(title: "Alert", message: "Last Name is Empty", preferredStyle:.alert)
        aleart1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(aleart1, animated: true)}
    if let PhoneNumber = self.phoneNumberTextField.text,PhoneNumber.isEmpty{
        let aleart1 = UIAlertController(title: "Alert", message: "Phone Number is Empty", preferredStyle:.alert)
        aleart1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(aleart1, animated: true)}
    if let quelification = self.quelificationTextField.text,quelification.isEmpty{
        let aleart1 = UIAlertController(title: "Alert", message: "quelification is Empty", preferredStyle:.alert)
        aleart1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(aleart1, animated: true)
    }
    if let passingYear = self.yearofPassingTextField.text,passingYear.isEmpty{
        let aleart1 = UIAlertController(title: "Alert", message: "passingYear is Empty", preferredStyle:.alert)
        aleart1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(aleart1, animated: true)
    }

}
    func showAlertBeforeSubmitingData(){
        dataSubmitAlert = UIAlertController(title: "Check Before Submit",
                                            message: "Do you relly want to submit",
                                            preferredStyle:.alert)
        uiAleartAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
                          print("yes action performed")})
        dataSubmitAlert?.addAction(uiAleartAction!)
        uiAleartAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { _ in
              print("No action performed")})
        dataSubmitAlert?.addAction(uiAleartAction!)
        self.present(dataSubmitAlert!, animated: true)
    
    }

    
}
