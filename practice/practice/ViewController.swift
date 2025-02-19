//
//  ViewController.swift
//  practice
//
//  Created by Wonsang Hwang on 1/17/25.
//

import UIKit


//https://www.nasa.gov/wp-content/uploads/2024/12/ngc2264.jpg

class ViewController: UIViewController {

    
    
    @IBOutlet weak var transitTableView: UITableView!
    
    let custom = CustomView()
    var progView = ProgressBarView()
    let heartButton = HeartButton()
    let textView1 = CustomTextView(textViewType: .textOutsideCircle)
    let textView2 = CustomTextView(textViewType: .textinsideCircle)
    let textView3 = CustomTextView(textViewType: .imgInsideCircle)
//    lazy var imageNames = getProfilePhotoNames(count: 5)
    
    var collectionView: UICollectionView!
    
    var selectedImage: UIImage?
    var selectedImageFrame: CGRect?
    var selectedLabelFrame: CGRect?
    var selectedString: String?
    
    func tableView() {
        transitTableView.delegate = self
        transitTableView.dataSource = self
    }
    
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
    
    
//    
//    func getProfilePhotoNames(count: Int) -> [String] {
//        var imageNames = [String]()
//        
//        for i in 1...count {
//            let imageName = "profile_photo_\(i)"
//            
//            if let _ = UIImage(named: imageName) {
//                imageNames.append(imageName)
//            }
//        }
//        
//        return imageNames
//    }
//    
//    func overlapStack() {
//        let st = OverlappingStack(imageNames: imageNames, itemSize: 100)
//        view.addSubview(st)
//        st.translatesAutoresizingMaskIntoConstraints = false
//        st.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        st.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//        st.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        st.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        
//    }
//    
//    func overlapScrollView() {
//        let st = OverlappingScrollView(imageNames: imageNames, itemSize: 100)
//        
//        view.addSubview(st)
//        st.translatesAutoresizingMaskIntoConstraints = false
//        st.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        st.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//        st.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        st.heightAnchor.constraint(equalToConstant: 100).isActive = true
//    }
//    
    
    
//    private func setupCollectionView() {
//        let layout = CustomZoominoutlayout()
//        
//        layout.itemSize = CGSize(width: 200, height: 200)
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 0   
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(PagingCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        
//        self.view.addSubview(collectionView)
//        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        
//        collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView()
        
//        setupCollectionView()
        
//        overlapStack()
//        overlapScrollView()
//        let overlapVC = CollectionViewController(imageNames: imageNames)
//        self.addChild(overlapVC)
//        self.view.addSubview(overlapVC.view)
//        overlapVC.didMove(toParent: self)
//        
//        overlapVC.view.translatesAutoresizingMaskIntoConstraints = false
//        overlapVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        overlapVC.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        
//        overlapVC.view.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        overlapVC.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
//        view.addSubview(textView1)
//        view.addSubview(textView2)
//        view.addSubview(textView3)
//        
//        textView2.backgroundColor = .blue.withAlphaComponent(0.1)
//        textView3.backgroundColor = .gray.withAlphaComponent(0.1)
//        
//        textView1.translatesAutoresizingMaskIntoConstraints = false
//        textView2.translatesAutoresizingMaskIntoConstraints = false
//        textView3.translatesAutoresizingMaskIntoConstraints = false
//        
//        textView1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        textView1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        textView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        textView1.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        
//        textView1.bottomAnchor.constraint(equalTo: textView2.topAnchor).isActive = true
//        textView2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        textView2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        textView2.bottomAnchor.constraint(equalTo: textView3.topAnchor).isActive = true
//     
//        textView3.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        textView3.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        textView3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        
//        textView1.heightAnchor.constraint(equalTo: textView2.heightAnchor).isActive = true
//        textView2.heightAnchor.constraint(equalTo: textView3.heightAnchor).isActive = true
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

//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PagingCollectionViewCell
//        
//        cell.imageTitleText = "test title"
//        cell.bgImage = UIImage(named: "profile_photo_1")
//        
//        return cell
//    }
//}




extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableImageCell", for: indexPath) as! TableImageCell
        cell.leftIamgeView.image = UIImage(named: "fashion\(indexPath.row % 18 + 1)")
        cell.middleLabel.text = "Fashion\(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detail.transitioningDelegate = self
        detail.modalPresentationStyle = .custom
        
        let cell = tableView.cellForRow(at: indexPath) as! TableImageCell
        self.selectedImage = cell.leftIamgeView.image
        self.selectedLabelFrame = cell.middleLabel.convert(cell.middleLabel.bounds, to: self.view)
        selectedImageFrame = cell.leftIamgeView.convert(cell.leftIamgeView.bounds, to: self.view)
        selectedString = cell.middleLabel.text
        
        detail.image = cell.leftIamgeView.image
        detail.detailText = cell.middleLabel.text
        self.present(detail, animated: true)
        
    }
}
