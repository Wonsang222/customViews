//
//  ViewController.swift
//  practice
//
//  Created by Wonsang Hwang on 1/17/25.
//

import UIKit


//https://www.nasa.gov/wp-content/uploads/2024/12/ngc2264.jpg

class ViewController: UIViewController {

    
    let custom = CustomView()
    var progView = ProgressBarView()
    let heartButton = HeartButton()
    let textView1 = CustomTextView(textViewType: .textOutsideCircle)
    let textView2 = CustomTextView(textViewType: .textinsideCircle)
    let textView3 = CustomTextView(textViewType: .imgInsideCircle)
//    @IBAction func reset(_ sender: Any) {
//        imgView.image = nil
//        progView.rate = 0
//    }
//    
//    @IBAction func btn(_ sender: Any) {
//        loadImageFromUrl()
//    }
//    func loadImageFromUrl() {
//        let urlString = "https://www.nasa.gov/wp-content/uploads/2024/12/ngc2264.jpg"
//        
//        let task: Void = URLSession(configuration: .default, delegate: self, delegateQueue: nil).downloadTask(with: URL(string: urlString)!).resume()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView1)
        view.addSubview(textView2)
        view.addSubview(textView3)
        
        textView2.backgroundColor = .blue.withAlphaComponent(0.1)
        textView3.backgroundColor = .gray.withAlphaComponent(0.1)
        
        textView1.translatesAutoresizingMaskIntoConstraints = false
        textView2.translatesAutoresizingMaskIntoConstraints = false
        textView3.translatesAutoresizingMaskIntoConstraints = false
        
        textView1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        textView1.bottomAnchor.constraint(equalTo: textView2.topAnchor).isActive = true
        textView2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView2.bottomAnchor.constraint(equalTo: textView3.topAnchor).isActive = true
     
        textView3.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView3.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        textView1.heightAnchor.constraint(equalTo: textView2.heightAnchor).isActive = true
        textView2.heightAnchor.constraint(equalTo: textView3.heightAnchor).isActive = true
//        self.view.addSubview(progView)
//        progView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            progView.leadingAnchor.constraint(equalTo: imgView.leadingAnchor),
////            progView.trailingAnchor.constraint(equalTo: imgView.trailingAnchor),
//            progView.bottomAnchor.constraint(equalTo: imgView.topAnchor),
//            progView.heightAnchor.constraint(equalToConstant: 100),
//            progView.widthAnchor.constraint(equalToConstant: 20)
//        ])
        
        
//        self.view.addSubview(heartButton)
//        heartButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            heartButton.widthAnchor.constraint(equalToConstant: 200),
//            heartButton.heightAnchor.constraint(equalToConstant: 200),
//            heartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            heartButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//        ])
    }


}
//
//extension ViewController: URLSessionDownloadDelegate {
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//        
//        do {
//            let data = try Data(contentsOf: location)
//            let image = UIImage(data: data)
//            DispatchQueue.main.async {
//                self.imgView.image = image
//            }
//            
//        } catch {
//            
//        }
//    }
//    
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//  
//        
//        let progress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
//        DispatchQueue.main.async {
//            self.progView.rate = progress
//        }
//    }
//    
//    
//}
