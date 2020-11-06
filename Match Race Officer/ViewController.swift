//
//  ViewController.swift
//  Match Race Officer
//
//  Created by Andrey Pereslavtsev on 06.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = indexPath.row.isMultiple(of: 2) ? .green : .cyan
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var splash: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Функция: \(#function)"
        label.textColor = .blue
        
        splash.image = UIImage(named: "splash")
        
        if let text = textView.text {
            textView.text = String(text.reversed())
        }
        
        // UIScrollView
        let imageView = UIImageView(image: UIImage(named: "splash"))
        let scrollView = UIScrollView(frame: CGRect(x: view.bounds.midX - 200, y: 100, width: 400, height: 200) )
        scrollView.backgroundColor = .blue
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        view.sendSubviewToBack(scrollView)
        
        tableView.backgroundColor = .cyan
        tableView.dataSource = self
        
    }


}

