//
//  TitleCollectionViewCell.swift
//  Alpflix
//
//  Created by Alperen Çerkez on 3.03.2025.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private var title: Title?
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        
        // Add context menu interaction
        contentView.isUserInteractionEnabled = true
        let interaction = UIContextMenuInteraction(delegate: self)
        contentView.addInteraction(interaction)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        posterImageView.sd_setImage(with: url, completed: nil)
        self.title = model.title
    }
    
    private func downloadTitleAt() {
        guard let title = self.title else { return }
        
        // Add visual feedback
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        DataPersistenceManager.shared.downloadTitleWith(model: title) { [weak self] result in
            switch result {
            case .success():
                NotificationCenter.default.post(name: NSNotification.Name("downloaded"), object: nil)
                self?.showDownloadMessage("Download Started", backgroundColor: .systemGreen)
            case .failure(let error):
                self?.showDownloadMessage("Download Failed", backgroundColor: .systemRed)
                print(error.localizedDescription)
            }
        }
    }
    
    private func showDownloadMessage(_ message: String, backgroundColor: UIColor) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            let downloadStartedLabel = UILabel()
            downloadStartedLabel.text = message
            downloadStartedLabel.textAlignment = .center
            downloadStartedLabel.backgroundColor = backgroundColor
            downloadStartedLabel.textColor = .white
            downloadStartedLabel.alpha = 0
            downloadStartedLabel.frame = CGRect(x: 0, y: self.contentView.bounds.height - 30, width: self.contentView.bounds.width, height: 30)
            self.contentView.addSubview(downloadStartedLabel)
            
            UIView.animate(withDuration: 0.3, animations: {
                downloadStartedLabel.alpha = 1
            }) { _ in
                UIView.animate(withDuration: 0.3, delay: 1.0, options: [], animations: {
                    downloadStartedLabel.alpha = 0
                }) { _ in
                    downloadStartedLabel.removeFromSuperview()
                }
            }
        }
    }
}

extension TitleCollectionViewCell: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        guard title != nil else { return nil }
        
        return UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil
        ) { [weak self] _ in
            let downloadAction = UIAction(
                title: "Download",
                image: UIImage(systemName: "arrow.down.circle"),
                handler: { _ in
                    self?.downloadTitleAt()
                }
            )
            
            return UIMenu(title: "", children: [downloadAction])
        }
    }
}
