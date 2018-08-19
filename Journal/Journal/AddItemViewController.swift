//
//  AddItemViewController.swift
//  Journal
//
//  Created by Invariant Telecom on 19/8/18.
//  Copyright © 2018 Md Abdul Gafur. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController : UIViewController,UITextViewDelegate{
    
    @IBOutlet weak var itemEntryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemEntryTextView.delegate = self
    }
    
    /* Updated for Swift 4 */
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveItem(_ sender: UIButton) {
        guard let enteredText = itemEntryTextView?.text else {
            return
        }
        
        if enteredText.isEmpty {
            let alert = UIAlertController(title: "Please Type Something", message: "Your entry was left blank.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { action in
                
            }))
            
             self.present(alert, animated: true, completion: nil)
        }else{
            guard let entryText = itemEntryTextView?.text else {
                return
            }
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newEntry = Item(context: context)
            newEntry.name = entryText
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            dismiss(animated: true, completion: nil)
            
        }
        
    }
    
}
