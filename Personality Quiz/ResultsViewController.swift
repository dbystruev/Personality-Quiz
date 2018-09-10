//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Denis Bystruev on 06/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responces: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        
        let responseTypes = responces.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
//        let frequentAnswersSorted = frequencyOfAnswers.sorted { (pair1, pair2) -> Bool in
//            return pair1.value > pair2.value
//        }
//
//        let mostCommontAnswer = frequentAnswersSorted.first!.key
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "Вы — это \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

}
