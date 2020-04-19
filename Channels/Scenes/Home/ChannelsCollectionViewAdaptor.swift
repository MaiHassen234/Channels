//
//  ChannelsCollectionViewAdaptor.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class ChannelsCollectionViewAdaptor: NSObject {
    var dataSource: UICollectionViewDiffableDataSource<Section, SectionObject<LatestMedia, Media, Categories>>?
    var sections = [Section]()
    var mediaObjects = [SectionObject<LatestMedia, Media, Categories>]()
    var channelsObjects = [SectionObject<LatestMedia, Media, Categories>]()
    var categoriesObjects = [SectionObject<LatestMedia, Media, Categories>]()
    var sectionsObjects = [[SectionObject<LatestMedia, Media, Categories>]]()
    var collectionView: UICollectionView!
    var channelsArray: [Channels]?
    
    func setAdaptor(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    // MARK: - Create TableView DataSource
    func createDataSource() {
        createCellsDataSource()
        createHeadersDataSource()
    }
    func createCellsDataSource() {
        dataSource = UICollectionViewDiffableDataSource <Section,
             SectionObject <LatestMedia,
             Media,
             Categories> >(collectionView: collectionView) { _, indexPath, item in
                 switch self.sections[indexPath.section].type {
                 case .episode:
                     
                     return self.configureEpisodeSection(index: indexPath, media: item.media)
                 case .series:
                     
                     return self.configureSeriesSection(index: indexPath, channels: item.channels)
                 case .course:
                     
                     return self.configureCourseSection(index: indexPath, channels: item.channels)
                 case .categories:
                     
                     return self.configureCategorieSection(index: indexPath, categories: item.categories)
                 }
        }
    }
    
    func createHeadersDataSource() {
    dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
        switch self?.sections[indexPath.section].type {
        case .episode:
            guard let sectionHeader = self?.configureTitleHeader(kind: kind, indexPath: indexPath, type: .episode)
                else { return nil }
            return sectionHeader
        case .series:
            guard let sectionHeader = self?.configureCollectionHeader(kind: kind,
                                                                      indexPath: indexPath,
                                                                      type: .series)
                else { return nil }
            return sectionHeader
            
        case .course:
            guard let sectionHeader = self?.configureCollectionHeader(kind: kind,
                                                                      indexPath: indexPath,
                                                                      type: .course)
                else { return nil }
            return sectionHeader
        case .categories:
            guard let sectionHeader = self?.configureTitleHeader(kind: kind,
                                                                 indexPath: indexPath,
                                                                 type: .categories)
                else { return nil }
            return sectionHeader
        case .none:
            return nil
        }
    }
    }

    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SectionObject<LatestMedia, Media, Categories>>()
        
        snapshot.appendSections(sections)
        
        for section in sections {
            switch section.type {
            case .episode:
                snapshot.appendItems(mediaObjects, toSection: section)
            case .course:
                guard let index = sections.firstIndex(of: section) else { return }
                snapshot.appendItems(sectionsObjects[index - 1], toSection: section)
            case .categories:
                
                snapshot.appendItems(categoriesObjects, toSection: section)
            case .series:
                guard let index = sections.firstIndex(of: section) else { return }
                snapshot.appendItems(sectionsObjects[index - 1], toSection: section)
            }
        }
        
        dataSource?.apply(snapshot)
    }
}

    // MARK: - Send Data To Configure Cells
    extension ChannelsCollectionViewAdaptor {
            
    private func configureEpisodeSection(index: IndexPath, media: Media?) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.identifier,
                                                            for: index) as? EpisodeCollectionViewCell else {
                                                                return UICollectionViewCell()
        }
        cell.configureEposideCell(with: media)
        return cell
    }
    
    private func configureCourseSection(index: IndexPath, channels: LatestMedia?) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            ChannelsCourseCollectionViewCell.identifier,
                                                            for: index) as? ChannelsCourseCollectionViewCell else {
                                                                return UICollectionViewCell()
        }
        cell.configureCourseCell(with: channels)
        return cell
    }
    
    private func configureSeriesSection(index: IndexPath, channels: LatestMedia?) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            ChannelsSeriesCollectionViewCell.identifier,
                                                            for: index) as? ChannelsSeriesCollectionViewCell
            else { return UICollectionViewCell() }
        cell.configureSeriesCell(with: channels)
        return cell
    }
    
    private func configureCategorieSection(index: IndexPath, categories: Categories?) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            CategoryCollectionViewCell.identifier,
                                                            for: index) as? CategoryCollectionViewCell
            else { return UICollectionViewCell() }
        cell.configureCategoryCell(with: categories)
        return cell
    }
    
    private func configureTitleHeader(kind: String,
                                      indexPath: IndexPath,
                                      type: SectionType) -> UICollectionReusableView? {
        
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderTitleCollectionReusableView.identifier,
            for: indexPath) as? HeaderTitleCollectionReusableView
        sectionHeader?.configureHeaderTitleView(type: type)
        
        return sectionHeader
    }

    private func configureCollectionHeader(kind: String,
                                           indexPath: IndexPath,
                                           type: SectionType) -> UICollectionReusableView? {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderCollectionReusableView.identifier,
            for: indexPath) as? HeaderCollectionReusableView
        if indexPath.section >= 1 {
            guard let item = channelsArray?[indexPath.section - 1] else { return nil }
            sectionHeader?.configureHeaderCollection(image: item.iconAsset?.thumbnailUrl,
                                                     title: item.title,
                                                     subtitle: item.mediaCount,
                                                     type: type)
        }
        return sectionHeader
    }
}

// MARK: - Add Data 

extension ChannelsCollectionViewAdaptor {
    func addEpisodes(episodes: [Media]?) {
        guard let data = episodes else { return }
        for episode in data {
            let obj = SectionObject<LatestMedia, Media, Categories>(channels: nil, media: episode, categories: nil)
            self.mediaObjects.append(obj)
        }
        let section = Section(type: .episode)
        self.sections.append(section)
      
    }
    
    func addChannels(channels: [Channels]?) {
        guard let channels = channels else { return }
        
        self.channelsArray = [Channels]()
        self.channelsArray?.append(contentsOf: channels)
      
        for channel in channels {
            if channel.series?.isEmpty ?? true {
                let section = Section(type: .series)
                self.sections.append(section)
                
            } else {
                let section = Section(type: .course)
                self.sections.append(section)
                
            }
            guard let items = channel.latestMedia else { return }
            for item in items {
                let obj = SectionObject<LatestMedia, Media, Categories>(channels: item, media: nil, categories: nil)
                self.channelsObjects.append(obj)
            }
            self.sectionsObjects.append(channelsObjects)
            channelsObjects = []
        }
    }
    
    func addCategories(category: [Categories]?) {
        guard let data = category else { return }
        for categorie in data {
            let obj = SectionObject<LatestMedia, Media, Categories>(channels: nil, media: nil, categories: categorie)
            self.categoriesObjects.append(obj)
        }
      
        let section = Section(type: .categories)
        self.sections.append(section)
        self.reloadData()
    }
    
}
