//
//  NSObject+ArrayObject.m
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-14.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import "NSObject+ArrayObject.h"


static NSString *const kDefaultMessage = @"Can't add/remove a nil object from the Array.";


@implementation NSObject (ArrayObject)

- (BOOL)isObjectEmpty
{
    return [self isObjectEmptyWithMessage:kDefaultMessage];
}


- (BOOL)isObjectEmptyWithMessage:(NSString *)message
{
    if (!self)
    {
        NSLog(@"%@", message);
        return YES;
    }
    
    return NO;
}

@end
