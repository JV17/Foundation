//
//  ArrayData.h
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-13.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ArrayData : NSObject

#pragma mark - Properties

/**
 Holds the value of the new object in the Array.
 */
@property (nonatomic, strong, readwrite) id data;


/**
 Holds a pointer to the next object in the Array.
 */
@property (nonatomic, strong, readwrite) ArrayData *next;


/**
 Holds a pointer to the previous object in the Array.
 */
@property (nonatomic, strong, readwrite) ArrayData *previous;


#pragma mark - Initializers

/**
 Custom initializer for an empty ArrayData.
 
 @return
    An instancetype of ArrayData.
 */
- (instancetype)init;


/**
 Custom initializer for the new object in the Array with a pointer to the next obecjt in the Array.
 
 @param data
    The data/object to store in the array.
 @param next
    The pointer to the next object in the array.
 @param previous
    The ponter to the previous object in the array.
 
 @return
    An instancetype of ArrayData.
 */
- (instancetype)initWithData:(id)data nextPointer:(ArrayData *)next previousPointer:(ArrayData *)previous;

@end
