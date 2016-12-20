//
//  FilterListViewViewController.m
//  ImageFilter
//
//  Created by Jaywant on 19/12/16.
//  Copyright © 2016 Jaywant. All rights reserved.
//

#import "FilterListViewViewController.h"


@interface FilterListViewViewController ()

@end

@implementation FilterListViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.title=@"ImageFilter";
    self.navigationItem.title = @"ImageFilter";
    effectTv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    effectArray=[[NSMutableArray alloc]initWithObjects:@"CISepiaTone",@"CIVignette",@"CIColorControls",@"CIPhotoEffectTonal",@"CIPhotoEffectTransfer",@"CIPhotoEffectProcess",@"CIPhotoEffectNoir",@"CIColorMonochrome", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger i = 0;
    
    if(tableView==effectTv)
    {
        i= [effectArray count];
    }
    
    return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(tableView==effectTv)
    {
        cell.textLabel.text=[effectArray objectAtIndex:indexPath.row];
        
        [cell.contentView.layer setBorderColor:[UIColor grayColor].CGColor];
        [cell.contentView.layer setBorderWidth:0.3f];
       
    }
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSLog(@"cell value %@",cell.textLabel.text);
        effectString=cell.textLabel.text;
        inputimage= [UIImage imageNamed:@"wallpaper.jpeg"];
        NSInteger item = [effectArray indexOfObject:effectString];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        detailsVc = [storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];

        switch (item)
        {
            case 0:
                // Item 1 CISepiaTone
            {
                CIContext *imageContext = [CIContext contextWithOptions:nil];
                CIImage *image = [[CIImage alloc] initWithImage:inputimage];
                CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                              keysAndValues: kCIInputImageKey, image,
                                    @"inputIntensity", @1, nil];
                
                CIImage *result = [filter valueForKey: @"outputImage"];
                CGImageRef cgImageRef = [imageContext createCGImage:result fromRect:[result extent]];
                UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
                detailsVc.filterImage=targetImage;
                [self.navigationController pushViewController:detailsVc animated:YES];
                
                break;
                
            }
           case 1:
            {
                // Item 2 CIVignette
                
                CIContext *imageContext = [CIContext contextWithOptions:nil];
                CIImage *image = [[CIImage alloc] initWithImage:inputimage];
                
                CIFilter *vignette = [CIFilter filterWithName:@"CIVignette"];
                [vignette setDefaults];
                [vignette setValue: image forKey: @"inputImage"];
                [vignette setValue: [NSNumber numberWithFloat: 1.0] forKey: @"inputIntensity"];
                [vignette setValue: [NSNumber numberWithFloat: 10.00 ] forKey: @"inputRadius"];
                
                CIImage *result = [vignette valueForKey: @"outputImage"];
                CGImageRef cgImageRef = [imageContext createCGImage:result fromRect:[result extent]];
                UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
                detailsVc.filterImage=targetImage;
                [self.navigationController pushViewController:detailsVc animated:YES];
                
                break;
                
            }
            case 2:
            {
                // Item 3 CIColorControls
                
                CIContext *imageContext = [CIContext contextWithOptions:nil];
                CIImage *image = [[CIImage alloc] initWithImage:inputimage];
                
                CIFilter *filter= [CIFilter filterWithName:@"CIColorControls"];
                
                [filter setValue:image forKey:@"inputImage"];
                
                [filter setValue:[NSNumber numberWithFloat:0] forKey:@"inputSaturation"];
                [filter setValue:[NSNumber numberWithFloat:1.05] forKey:@"inputContrast"];//1.05
                
                CIImage *result = [filter valueForKey: @"outputImage"];
                CGImageRef cgImageRef = [imageContext createCGImage:result fromRect:[result extent]];
                
                UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
                detailsVc.filterImage=targetImage;
                [self.navigationController pushViewController:detailsVc animated:YES];
                break;
            }
            case 3:
            {    // Item 4 CIPhotoEffectTonal
                
                CIContext *imageContext = [CIContext contextWithOptions:nil];
                
                CIImage *image = [[CIImage alloc] initWithImage:inputimage];
                
                CIFilter *filter= [CIFilter filterWithName:@"CIPhotoEffectTonal"];
                
                [filter setValue:image forKey:@"inputImage"];
                CIImage *result = [filter valueForKey: @"outputImage"];
                CGImageRef cgImageRef = [imageContext createCGImage:result fromRect:[result extent]];
                
                UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
                detailsVc.filterImage=targetImage;
                [self.navigationController pushViewController:detailsVc animated:YES];
                break;
            }
            case 4:
            {   // Item 5 CIPhotoEffectTransfer
                
                CIContext *imageContext = [CIContext contextWithOptions:nil];
                CIImage *image = [[CIImage alloc] initWithImage:inputimage];
                CIFilter *filter= [CIFilter filterWithName:@"CIPhotoEffectTransfer"];
                [filter setValue:image forKey:@"inputImage"];
                CIImage *result = [filter valueForKey: @"outputImage"];
                CGImageRef cgImageRef = [imageContext createCGImage:result fromRect:[result extent]];
                
                UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
                detailsVc.filterImage=targetImage;
                [self.navigationController pushViewController:detailsVc animated:YES];
                break;
                
            }
            case 5:
            {
                // Item 6 CIPhotoEffectProcess
                CIContext *imageContext = [CIContext contextWithOptions:nil];
                CIImage *image = [[CIImage alloc] initWithImage:inputimage];
                CIFilter *filter= [CIFilter filterWithName:@"CIPhotoEffectProcess"];
                [filter setValue:image forKey:@"inputImage"];
                CIImage *result = [filter valueForKey: @"outputImage"];
                CGImageRef cgImageRef = [imageContext createCGImage:result fromRect:[result extent]];
                
                UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
                detailsVc.filterImage=targetImage;
                [self.navigationController pushViewController:detailsVc animated:YES];
                break;
            }
            case 6:
            {     //Item 7 CIPhotoEffectNoir
                
                CIContext *imageContext = [CIContext contextWithOptions:nil];
                CIImage *image = [[CIImage alloc] initWithImage:inputimage];
                
                CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectNoir" keysAndValues: kCIInputImageKey,image, nil];
                CIImage *result = [filter valueForKey: @"outputImage"];
                CGImageRef cgImageRef = [imageContext createCGImage:result fromRect:[result extent]];
                UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
                detailsVc.filterImage=targetImage;
                [self.navigationController pushViewController:detailsVc animated:YES];
                break;
                
            }
            case 7:
            {     // Item 9  CIColorMonochrome
                CIContext *imageContext = [CIContext contextWithOptions:nil];
                CIImage *image = [[CIImage alloc] initWithImage:inputimage];
                CIFilter *filter = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues: kCIInputImageKey,image,@"inputColor",[CIColor colorWithRed:0.5 green:0.5 blue:1.0],@"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
                CIImage *result = [filter valueForKey: @"outputImage"];
                CGImageRef cgImageRef = [imageContext createCGImage:result fromRect:[result extent]];
                UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
                detailsVc.filterImage=targetImage;
                [self.navigationController pushViewController:detailsVc animated:YES];
                break;
            }
            case 8:
            {
                
                CIContext *imageContext = [CIContext contextWithOptions:nil];
                
                UIImage *img1 =[UIImage imageNamed:@"effct.jpg"];
                CIImage *image = [[CIImage alloc] initWithImage:inputimage];
                CIImage *image1 = [[CIImage alloc] initWithImage:img1];
                
                CIFilter *filter = [CIFilter filterWithName: @"CIAccordionFoldTransition"];
                
                [filter setValue:image forKey:@"inputImage"];
                [filter setValue:image1 forKey:@"inputTargetImage"];
                [filter setValue:@3 forKey:@"inputNumberOfFolds"];
                [filter setValue:@0.5 forKey:@"inputFoldShadowAmount"];
                [filter setValue:@50 forKey:@"inputBottomHeight"];
                
                CGFloat transitionTime = 0.5; //* (1 - cos(fmodf(time, 1.0f) * M_PI));
                [filter setValue:@(transitionTime) forKey:@"inputTime"];
                
                CIImage *result = [filter valueForKey: @"outputImage"];
                CGImageRef cgImageRef = [imageContext createCGImage:result fromRect:[result extent]];
                UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
                detailsVc.filterImage=targetImage;
                [self.navigationController pushViewController:detailsVc animated:YES];
                break;
                
            }
            default:
                break;
        }
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
