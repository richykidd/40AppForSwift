//
//  CustomUIbum.swift
//  32-图片保存到相册
//
//  Created by Richy Li on 17/1/2.
//  Copyright © 2017年 richyli. All rights reserved.
//

import Photos

class CustomUlbum {

    static let sharedInstance = CustomUlbum()
    var assetCollection: PHAssetCollection!
    var albumFound: Bool = false
    var photosAsset: PHFetchResult<AnyObject>!
    var collection: PHAssetCollection!
    var assetCollectionPlaceholder: PHObjectPlaceholder!
    
    
    // 创建相册
    fileprivate func createAlum(_ name: String){
    
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", name)
        let collection: PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        
        if let _ : AnyObject = collection.firstObject {
        
            self.albumFound = true
            assetCollection = collection.firstObject! as PHAssetCollection
        
        } else {
        
            PHPhotoLibrary.shared().performChanges({ 
                let createAlbumRequest: PHAssetCollectionChangeRequest = PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: name)
                self.assetCollectionPlaceholder = createAlbumRequest.placeholderForCreatedAssetCollection
            }, completionHandler: { (success, error) in
                self.albumFound = ( success ? true: false)
                
                if success {
                
                    let collectionFetchResult = PHAssetCollection.fetchAssetCollections(withLocalIdentifiers: [self.assetCollectionPlaceholder.localIdentifier], options: nil)
                    self.assetCollection = collectionFetchResult.firstObject! as PHAssetCollection
                
                }
            })
        
        
        }
    
    }
    func saveImage(_ image: UIImage, ulbumName: String)  {
        self.createAlum(ulbumName)
        
        if self.assetCollection != nil {
        
            PHPhotoLibrary.shared().performChanges({ 
                let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
                let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset
                let albumChangeRequest = PHAssetCollectionChangeRequest(for: self.assetCollection)
                albumChangeRequest?.addAssets([assetPlaceholder!] as NSArray)
            }, completionHandler: nil)
        
        }
    }
    



}
