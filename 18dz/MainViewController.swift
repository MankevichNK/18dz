//
//  ViewController.swift
//  18dz
//
//  Created by Пользователь on 3/17/20.
//  Copyright © 2020 Пользователь. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    var musicTracks: [Tracks] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        tableView.dataSource = self

    }
    @IBAction func buttonAddDidClick(_ sender: Any) {
        showSecondVC()
    }
    func showSecondVC() {
        let secondVC = getSecondVC()
        secondVC.addTracks = { track in
            self.musicTracks.append(track)
            self.tableView.reloadData()
            
        }
        navigationController!.pushViewController(secondVC, animated: true)
    }
    
    func getSecondVC() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifire = String(describing: SecondViewController.self)
        return storyboard.instantiateViewController(identifier: identifire) as! SecondViewController
    }
    
    
    @IBAction func editButtonDidClick(_ sender: Any) {
        var isEditing = tableView.isEditing
        isEditing.toggle()
        tableView.setEditing(isEditing, animated: true)
        if isEditing {
            editButton.title = "Done"
        } else {
            editButton.title = "Edit"
        }
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicTracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackTableViewCell") as! TrackTableViewCell
        let track = musicTracks[indexPath.row]
        let title: String
        title = "\(track.nameTrack), \(track.nameExecutor), \(track.genre)"
        cell.labelCell.text = title
        cell.imageCell.image = UIImage(named: "album")
        cell.accessoryType = .detailButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        musicTracks.remove(at: indexPath.row)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            self.tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveItems = musicTracks[sourceIndexPath.row]
        musicTracks.remove(at: sourceIndexPath.row)
        musicTracks.insert(moveItems, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath){
        
        showInfoVC()
        
        
    }
    func showInfoVC() {
        let infoVC = getInfoVC()
    
        navigationController!.pushViewController(infoVC, animated: true)
    }
    
    func getInfoVC() -> InfoViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifire = String(describing: InfoViewController.self)
        return storyboard.instantiateViewController(identifier: identifire) as! InfoViewController
    }
}
