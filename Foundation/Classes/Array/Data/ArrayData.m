//
//  ArrayData.m
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-13.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import "ArrayData.h"


@implementation ArrayData

- (instancetype)init
{
    return [self initWithData:nil nextPointer:nil previousPointer:nil];
}


- (instancetype)initWithData:(id)data nextPointer:(ArrayData *)next previousPointer:(ArrayData *)previous
{
    self = [super init];
    
    if (self)
    {
        _data = data;
        _next = next;
        _previous = previous;
    }
    
    return self;
}

@end
