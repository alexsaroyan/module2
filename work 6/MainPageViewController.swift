
import UIKit

class WindowCell: UICollectionViewCell {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let headlineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(logoImageView)
        addSubview(headlineLabel)
        addSubview(textLabel)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            
            headlineLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            headlineLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 8),
            headlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            textLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 4),
            textLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -48)
        ])
    }
}

import UIKit

class MainPageViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 77, left: 24, bottom: 24, right: 24)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(WindowCell.self, forCellWithReuseIdentifier: "WindowCell")
        return collectionView
    }()
    
    private let windowsData: [(headline: String, text: String, logoName: String)] = [
        ("Magari karta", "Pulebs agrovebs egreve", "Frame 62"),
        ("Bandzi karta", "Pulebs ver agrovebs egreve", "Frame 63"),
        ("Gold karta", "Magtize agrovebs sms-ebs", "Frame 64"),
        ("Super karta", "Metros vagonshi adgils ikavebs", "Frame 65")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCollectionView()
        setupButton()
    }
    
    private func setupBackground() {
        let backgroundImage = UIImageView(image: UIImage(named: "Rectangle 1"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.frame = view.bounds
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
    private func setupButton() {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 117/255, blue: 1, alpha: 1)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}

extension MainPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return windowsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WindowCell", for: indexPath) as! WindowCell
        let data = windowsData[indexPath.item]
        cell.headlineLabel.text = data.headline
        cell.textLabel.text = data.text
        cell.logoImageView.image = UIImage(named: data.logoName)
        return cell
    }
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let windowWidth: CGFloat = (view.bounds.width - 64) / 2
        let windowHeight: CGFloat = 192
        return CGSize(width: windowWidth, height: windowHeight)
    }
}
