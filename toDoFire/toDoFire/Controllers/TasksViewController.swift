//
//  TasksViewController.swift
//  toDoFire
//
//  Created by Nochnoy Anton on 18/03/2019.
//  Copyright © 2019 Nochnoy Anton. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {

    let idCell = "FuckOff"
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.backgroundColor = .blue
//        self.tableView.separatorStyle = .none
        self.view.add(subview: tableView, with: [.leading, .trailing, .bottom, .top])
        
//        tableView.registerClass(UITableViewCell(), forCellReuseIdentifier: idCell)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        
        
    }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
}

extension TasksViewController: UITableViewDelegate {
    
}


extension UIView {
    func add(subview: UIView, with anchors: [Anchor]) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        for anchor in anchors {
            applyAnchor(anchor: anchor, view: subview)
        }
    }
    
    func centerSubviewsVertically() {
        self.subviews.forEach({ $0.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true })
    }
    
    func removeView(with tag: Int) {
        if let view = self.viewWithTag(tag) {
            if
                let bar = self as? UINavigationBar,
                !ProcessInfo().isOperatingSystemAtLeast(
                    OperatingSystemVersion(majorVersion: 11, minorVersion: 0, patchVersion: 0)) {
                // avoiding NSInternalInconsistencyException on iOS 10.3-
                bar.constraints.forEach({ $0.isActive = false })
            }
            view.removeFromSuperview()
        }
    }
    
    func removeAllSubviews() {
        let toRemove = self.subviews
        for v in toRemove {
            v.removeFromSuperview()
        }
    }
    
    func add(subview: UIView, with insets: UIEdgeInsets) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: insets.left).isActive = true
        subview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -insets.right).isActive = true
        subview.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top).isActive = true
        subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom).isActive = true
    }
}


private func applyAnchor(anchor: Anchor, view: UIView) {
    switch anchor {
    case .leading:
        view.leadingAnchor.constraint(equalTo: view.superview!.leadingAnchor).isActive = true
    case .trailing:
        view.trailingAnchor.constraint(equalTo: view.superview!.trailingAnchor).isActive = true
    case .top:
        view.topAnchor.constraint(equalTo: view.superview!.topAnchor).isActive = true
    case .bottom:
        view.bottomAnchor.constraint(equalTo: view.superview!.bottomAnchor).isActive = true
    }
}


enum Anchor {
    case leading
    case trailing
    case top
    case bottom
}
