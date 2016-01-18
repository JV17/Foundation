//
//  Array.h
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-13.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Array : NSObject

#pragma mark - Properties

/**
 Holds the number of objects in the Array.
 */
@property (nonatomic, assign, readonly) NSUInteger count;

/**
 Holds a Boolean telling is the array is empty or not.
 */
@property (nonatomic, assign, readonly) BOOL isEmpty;

/**
 Holds the array value as NSArray.
 */
@property (nonatomic, assign, readonly) NSArray *asNSArrayValue;


#pragma mark - Lifecycle

/**
 Default initializer for the Array.
 
 @return 
    An instancetype of Array.
 */
- (instancetype)init;


/**
 Default initializer for the Array with objects.
 
 @param array
    The array holding the objects to store in our array.
 
 @return
    An instancetype of Array.
 */
- (instancetype)initWithObjects:(NSArray *)array;


#pragma mark - Adding Objects

/**
 Adds an object to the front of the array.
 
 @param object
    The new object to add in the array.
 */
- (void)addObjectFront:(id)object;


/**
 Adds an object to the end of the array.
 
 @param object
    The new object to add in the array.
 */
- (void)addObjectBack:(id)object;


/**
 Adds an object before the specified object in the array.
 
 @param object
    The new object to add in the array.
 @param beforeObject
    The before object where we will add the new object.
 */
- (void)addObject:(id)object beforeObject:(id)beforeObject;


/**
 Adds an object after the specified object in the array.
 
 @param object
    The new object to add in the array.
 @param afterObject
    The after object where we will add the new object.
 */
- (void)addObject:(id)object afterObject:(id)afterObject;


/**
 Replaces an object with the new specified object in the array.
 
 @param object
    The object to replace.
 @param newObject
    The new object to replace.
 */
- (void)replaceObject:(id)object withObject:(id)newObject;


#pragma mark - Remove Objects

/**
 Removes specified object from the array.
 
 @param object
    The object to remove from the array.
 */
- (void)removeObject:(id)object;


/**
 Removes all objects from the array.
 */
- (void)removeAllObjects;


/**
 Removes first object from the array.
 */
- (void)removeFirstObject;


/**
 Removes last object from the array.
 */
- (void)removeLastObject;


#pragma mark - Subscripting

/**
 Allows the operator [] overloading for the array.
 
 @param idx
    The index of the object.
 
 @return
    The object found at specified index.
 */
- (id)objectAtIndexedSubscript:(NSUInteger)idx;


/**
 Allows the operator [] overloading for the array.
 
 @param obj
    The new object to set in the array.
 @param idx
    The index of the object.
  */
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;


#pragma mark - Allows the use of "in"

/**
 Returns by reference a C array of objects over which the sender should iterate, and as the return value the number of objects in the array.
 
 @param state
    Context information that is used in the enumeration to, in addition to other possibilities, ensure that the collection has not been mutated.
 @param stackbuf
    A C array of objects over which the sender is to iterate.
 @param len
    The maximum number of objects to return in @a stackbuf.
 */
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])stackbuf count:(NSUInteger)len;

@end
