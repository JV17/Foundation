//
//  ArrayData+HeadTail.m
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-14.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import "ArrayData+HeadTail.h"


static NSString *const kHeadMessage = @"Head is currently empty.";

static NSString *const kTailMessage = @"Tail is currently empty.";


@implementation ArrayData (HeadTail)

#pragma mark - Head Helper Functions

- (BOOL)isHeadEmpty
{
    return [self isDataEmptyWithMessage:kHeadMessage];
}


#pragma mark - Tail Helper Functions

- (BOOL)isTailEmpty
{
    return [self isDataEmptyWithMessage:kTailMessage];
}


#pragma mark - Helper Functions

- (BOOL)isDataEmptyWithMessage:(NSString *)message
{
    if (!self.data)
    {
        NSLog(@"%@", message);
        return YES;
    }
    
    return NO;
}


#pragma mark - Remove

- (void)removeObject
{
    self.data = nil;
    self.next = nil;
    self.previous = nil;
}

@end
