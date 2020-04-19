//
//  HomeViewController.swift
//  Channels
//
//  Created by Mai hassen on 3/23/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomePresenter> {
    // MARK: - Private IBOutlets
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var channelsCollectionView: UICollectionView!
    // MARK: - Private Variables
    private var adaptor = ChannelsCollectionViewAdaptor()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        titleLabel.setupView(with: "Channels",
                             textColor: Asset.Colors.channelColor.color,
                             font: FontFamily.Gilroy.extraBold.font(size: 28))
        self.setUpCollectionView()
        presenter.viewDidLoad()
    }
    
}
// MARK: - Setup View
extension HomeViewController {
    func setUpCollectionView() {
        
        channelsCollectionView.collectionViewLayout = createCompositionalLayout()
        channelsCollectionView.register(HeaderTitleCollectionReusableView.nib,
                                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                        withReuseIdentifier: HeaderTitleCollectionReusableView.identifier)
        channelsCollectionView.register(HeaderCollectionReusableView.nib,
                                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                        withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
        channelsCollectionView.register(EpisodeCollectionViewCell.nib,
                                        forCellWithReuseIdentifier: EpisodeCollectionViewCell.identifier)
        channelsCollectionView.register(ChannelsSeriesCollectionViewCell.nib,
                                        forCellWithReuseIdentifier: ChannelsSeriesCollectionViewCell.identifier)
        channelsCollectionView.register(ChannelsCourseCollectionViewCell.nib,
                                        forCellWithReuseIdentifier: ChannelsCourseCollectionViewCell.identifier)
        channelsCollectionView.register(CategoryCollectionViewCell.nib,
                                        forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        adaptor.setAdaptor(collectionView: channelsCollectionView)
        
        channelsCollectionView.dataSource = adaptor.dataSource
        adaptor.createDataSource()
        channelsCollectionView.dataSource = adaptor.dataSource
        adaptor.reloadData()
        channelsCollectionView.reloadData()
    }
    
}

// MARK: - Compositional Layouts
extension HomeViewController {
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, _:
            NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.adaptor.sections[sectionIndex]
            switch section.type {
            case .episode:
                return self.buildEposideHorizontalSectionLayout()
            case .course:
                return self.buildCourseHorizontalSectionLayout()
            case .series:
                return self.buildSeriesHorizontalSectionLayout()
            case .categories:
                return self.buildCategoriesVerticalSectionLayout()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 10
        layout.configuration = config
        return layout
    }
    
// MARK: - Sections
// MARK: - Eposide Section
        func buildEposideHorizontalSectionLayout() -> NSCollectionLayoutSection {
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.3),
                                                                                 heightDimension:
                .absolute(0.40 * Utilities.screenHeight)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 2.0)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                       heightDimension: .absolute(0.41 * Utilities.screenHeight)),
                                                           subitem: item, count: 2)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
            section.orthogonalScrollingBehavior = .continuous
    
             let layoutSectionHeader = buildSectionHeader()
            section.boundarySupplementaryItems = [layoutSectionHeader]
            return section
        }
    
    // MARK: - Channel Course Section
    func buildCourseHorizontalSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.8),
                                                                             heightDimension: .absolute(0.38
                                                                                * Utilities.screenHeight)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 5.0)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:
            NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                   heightDimension: .absolute(0.39 * Utilities.screenHeight)),
                                                       subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        section.orthogonalScrollingBehavior = .continuous
        let layoutSectionHeader = buildSectionHeaderWithImage()
        section.boundarySupplementaryItems = [layoutSectionHeader]
        return section
    }
    
      // MARK: - Channel Series Section
    func buildSeriesHorizontalSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:
            NSCollectionLayoutSize(widthDimension: .absolute(0.85 * Utilities.screenWidth),
                                   heightDimension:
            .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 5.0)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:
            NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.8),
                                   heightDimension: .fractionalHeight(0.5)),
                                                       subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        section.orthogonalScrollingBehavior = .continuous
        let layoutSectionHeader = buildSectionHeaderWithImage()
        section.boundarySupplementaryItems = [layoutSectionHeader]
        return section
    }
        
    // MARK: - Category Vertical Section
    
    func buildCategoriesVerticalSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:
            NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                   heightDimension: .absolute(0.1 * Utilities.screenHeight)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension:
            .absolute(0.12 * Utilities.screenHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 2, bottom: 10, trailing: 2)
        let layoutSectionHeader = buildSectionHeader()
        section.boundarySupplementaryItems = [layoutSectionHeader]
        return section
    }
    
    //    func buildHorizontalSectionLayout() -> NSCollectionLayoutSection {
    //        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
    //                                                                             heightDimension:
    //            .fractionalHeight(1)))
    //        item.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 20.0, bottom: 16.0, trailing: 2.0)
    //        let group = NSCollectionLayoutGroup.horizontal(layoutSize:
    //            NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
    //                                   heightDimension: .fractionalHeight(0.48)),
    //                                                       subitem: item, count: 2)
    //        let section = NSCollectionLayoutSection(group: group)
    //        section.contentInsets = NSDirectionalEdgeInsets(top: 16.0, leading: 0.0, bottom: 16.0, trailing: 0.0)
    //        section.orthogonalScrollingBehavior = .continuous
    //
    //          let layoutSectionHeader = createSectionHeader()
    //          section.boundarySupplementaryItems = [layoutSectionHeader]
    //        return section
    //    }
    
    // MARK: - Headers
    // MARK: - Section Header With Title
    func buildSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                      heightDimension: .estimated(0.08 * Utilities.screenHeight))
        let layoutHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutHeaderSize,
                                                                       elementKind:
            UICollectionView.elementKindSectionHeader,
                                                                       alignment: .top)
        return layoutHeader
    }
    
    // MARK: - Section Header With Image And Title
    func buildSectionHeaderWithImage() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                      heightDimension: .estimated(0.15 * Utilities.screenHeight))
        let layoutHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutHeaderSize,
                                                                       elementKind:
            UICollectionView.elementKindSectionHeader,
                                                                       alignment: .top)
        return layoutHeader
    }
}

// MARK: - HomeViewProtocol Methods

extension HomeViewController: HomeViewProtocol {
    func addEpisodes(episodes: [Media]?) {
        adaptor.addEpisodes(episodes: episodes)
    }
    func addChannels(channels: [Channels]?) {
        adaptor.addChannels(channels: channels)
    }
    func addCategories(category: [Categories]?) {
        adaptor.addCategories(category: category)
    }
}
