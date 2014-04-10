//
//  ViewController.m
//  Times
//
//  Created by Dylan Bourgeois on 09/04/14.
//  Copyright (c) 2014 Dylan Bourgeois. All rights reserved.
//

#import "ResultModel.h"
#import "ViewController.h"

@interface ViewController ()
{
    ResultModel* result;
    NSArray* items;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [[NSData alloc] initWithContentsOfURL:
                               [NSURL URLWithString:@"http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=5dea691540130ee8f5c970ddc2d8ef4e:10:69169117"]];
        NSDictionary* json = nil;
        if (data) {
            json = [NSJSONSerialization
                    JSONObjectWithData:data
                    options:kNilOptions
                    error:nil];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            result = [[ResultModel alloc]init];
            result.results = [json objectForKey:@"results"];
            NSArray* mediaArray = [[[[result.results objectAtIndex:0] objectForKey:@"media"] objectAtIndex:0] objectForKey:@"media-metadata"];
            NSLog(@"%@", mediaArray);
            
            for (NSDictionary* image in mediaArray) {
                NSLog(@"%@", [image objectForKey:@"format"]);
                if ([[image objectForKey:@"format"] isEqualToString:@"superJumbo"]) {
                    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[image objectForKey:@"url"]]];
                    self.imageView.image = [UIImage imageWithData: imageData];
                    
                    break;
                }
            }

            
        });
        
    });

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
