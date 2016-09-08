//
//  MasterViewController.swift
//  WordScramble
//
//  Created by Robert M. Errera on 9/6/16.
//  Copyright © 2016 Robert M. Errera. All rights reserved.
//

import UIKit
import GameplayKit

class MasterViewController: UITableViewController {

    var objects = [String]()
    var allwords = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startWordsPath = NSBundle.mainBundle().pathForResource("start", ofType: "txt") {
            if let startWords = try? String(contentsOfFile: startWordsPath, usedEncoding: nil) {
                allwords = startWords.componentsSeparatedByString("\n")
            }
        }
        
        startGame()
    }
    
    func startGame() {
        allwords = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(allwords) as! [String]
        title = allwords[0]
        objects.removeAll(keepCapacity: true)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }
}

