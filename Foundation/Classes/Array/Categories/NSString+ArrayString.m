//
//  NSString+ArrayString.m
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-13.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import "NSString+ArrayString.h"


@implementation NSString (ArrayString)

- (NSString *)descriptionStringWithString:(NSString *)string object:(id)object
{
    NSString *appendString = [NSString stringWithFormat:string, object];
    return [self stringByAppendingString:appendString];
}

@end
