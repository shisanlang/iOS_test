//
//  Photo.h
//  iCitySuzhou2.0
//
//  Created by Chen Nan on 6/21/11.
//  Copyright 2011 Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

// Class
@class Photo;

// Delegate
@protocol PhotoDelegate <NSObject>
- (void)photoDidFinishLoading:(Photo *)photo;
- (void)photoDidFailToLoad:(Photo *)photo;
@end

// Photo
@interface Photo : NSObject {
	
	// Image
	NSString *photoPath;
	NSURL *photoURL;
	UIImage *photoImage;
	
	// Flags
	BOOL workingInBackground;
	
}

// Class
+ (Photo *)photoWithImage:(UIImage *)image;
+ (Photo *)photoWithFilePath:(NSString *)path;
+ (Photo *)photoWithURL:(NSURL *)url;

// Init
- (id)initWithImage:(UIImage *)image;
- (id)initWithFilePath:(NSString *)path;
- (id)initWithURL:(NSURL *)url;

// Public methods
- (BOOL)isImageAvailable;
- (UIImage *)image;
- (UIImage *)obtainImage;
- (void)obtainImageInBackgroundAndNotify:(id <PhotoDelegate>)notifyDelegate;
- (void)releasePhoto;

@end
