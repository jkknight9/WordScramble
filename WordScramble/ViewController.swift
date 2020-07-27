//
//  ViewController.swift
//  WordScramble
//
//  Created by Jack Knight on 7/27/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var allwords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allwords = startWords.components(separatedBy: "\n")
            }
        }
        if allwords.isEmpty {
            allwords = ["silkworm"]
        }
        
        startGame()
        
    }
    func startGame() {
        title = allwords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
}

