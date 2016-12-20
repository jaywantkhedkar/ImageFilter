//
//  FilterListViewViewController.h
//  ImageFilter
//
//  Created by Jaywant on 19/12/16.
//  Copyright © 2016 Jaywant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"

@interface FilterListViewViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
      //filter Parameter//
    NSMutableArray *effectArray;
    NSString *effectString;
    UIImage *inputimage;
    DetailsViewController  *detailsVc;
    
    
 IBOutlet UITableView *effectTv;
}
@end
