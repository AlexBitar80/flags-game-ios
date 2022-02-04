//
//  ViewController.swift
//  project2
//
//  Created by João Alexandre on 31/01/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAnswered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "russia",
            "spain",
            "uk",
            "us"
        ]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) pontuação atual \(score)"
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correto"
            score += 1
        } else {
            title = """
                Resposta errada!
            
                Está é a bandeira de
                \(countries[sender.tag].uppercased()) :(
            """
            score -= 1
        }
        
        questionsAnswered += 1
        
        if questionsAnswered < 10 {
            var ac = UIAlertController(title: title, message: "Sua pontuação agora é de \(score).", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continuar", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        } else {
            var ac = UIAlertController(title: title, message: "Sua pontuação final é de \(score). Parabéns!", preferredStyle: .alert)
        
            ac.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: askQuestion))
                         
            present(ac, animated: true)
            
            score = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
