//
//  DetailsViewController.h
//  ImageFilter
//
//  Created by Jaywant on 19/12/16.
//  Copyright © 2016 Jaywant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController
{
    IBOutlet UIImageView *filterImgv;
}
@property(strong,nonatomic)  UIImage *filterImage;

@end
