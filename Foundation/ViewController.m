//
//  ViewController.m
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-13.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import "ViewController.h"
#import "Array.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Array *arr = [[Array alloc] init];
    [arr addObjectBack:@"0"];
    [arr addObjectBack:@"1"];
    [arr addObjectBack:@"2"];
    [arr addObjectBack:@"3"];
    [arr addObjectBack:@"4"];
    [arr addObjectBack:@"5"];
    [arr addObjectBack:@"6"];
    [arr addObjectBack:@"7"];
    [arr addObjectBack:@"8"];
    [arr addObjectBack:@"9"];
    [arr addObjectFront:@"front"];
    
    [arr addObject:@"test" beforeObject:@"0"];
    [arr addObject:@"third" afterObject:@"9"];
    
    [arr replaceObject:@"test" withObject:@"1"];
    [arr replaceObject:@"third" withObject:@"9"];
    
    [arr removeObject:@"0"];
    [arr removeObject:@"9"];
    [arr removeObject:@"6"];
    [arr removeObject:@"1"];
    
//    [arr removeAllObjects];
    
    arr[0] = @"1000";
    
    NSLog(@"%@", arr[2]);
    
    NSLog(@"counter %lu", (unsigned long)arr.count);
    NSLog(@"Printing Array: %@", arr);
    
    for (id obj in arr)
    {
        NSLog(@"testing in: %@", obj);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
