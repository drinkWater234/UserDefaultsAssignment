//
//  ViewController.swift
//  userDefaultAssignment
//
//  Created by Consultant on 12/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var randomStringBtn: UIButton!
    @IBOutlet weak var randomEmojiBtn: UIButton!
    @IBOutlet weak var randomNumberBtn: UIButton!
    
    let emojis = ["😀", "🥰", "😗", "🤪", "🤑", "🤫", "🫡", "😴"]
    let alphanumeric = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    

    let defaults = UserDefaults.standard
    
    func getRandomAlphaNumeric(length: Int) -> String
    {
        return String((0..<length).map{ _ in alphanumeric.randomElement()!})
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        outputLabel.text = defaults.string(forKey: "myOutput")
    }
    
    @IBAction func generateRandomString(_ sender: Any)
    {
        let output = getRandomAlphaNumeric(length: 10)
        outputLabel.text = output
        defaults.set(output, forKey: "myOutput")
    }
    
    @IBAction func genarateRandomNumber(_ sender: Any)
    {
        let output = String(Int.random(in: 0...100))
        outputLabel.text = output
        defaults.set(output, forKey: "myOutput")
    }

    @IBAction func generateRandomEmoji(_ sender: Any)
    {
        let output = emojis.randomElement()
        outputLabel.text = output
        defaults.set(output, forKey: "myOutput")
    }
}

