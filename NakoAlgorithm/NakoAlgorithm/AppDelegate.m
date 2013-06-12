//
//  AppDelegate.m
//  NakoAlgorithm
//
//  Created by nako on 6/11/13.
//  Copyright (c) 2013 nako. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_managedObjectContext release];
    [_managedObjectModel release];
    [_persistentStoreCoordinator release];
    [super dealloc];
}

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

//순차 탐색.
- (NSInteger)LinearSearch:(NSArray *)arr withObject:(id)object
{
    for( int i = 0 ; i < [arr count]; i++ )
        if([[arr objectAtIndex:i] isEqual:object])
            return i;
    return -1;
}

//이진 탐색.
- (NSInteger)BinarySearch:(NSInteger *)arr withRow:(NSInteger)row withHigh:(NSInteger)high withValue:(NSInteger)value
{
    if( row > high )
        return -1;
    
    int mid = (row + high) / 2;
    
    if( arr[mid] == value )
        return mid;
    else if( arr[mid] > value )
        return [self BinarySearch:arr withRow:row withHigh:mid-1 withValue:value];
    else if( arr[mid] < value )
        return [self BinarySearch:arr withRow:mid+1 withHigh:high withValue:value];
    
    return -1;
}

// 버블 정렬
// 인접한 값을 비교하는 정렬이다. 쉽게 이해하자면 배열의 개수 -1 만큼 스텝이 반복되어야 하며 이 이유는 가장 오른쪽 , 즉 가장 큰 값은 첫 정렬시 구해지기 때문이다.
- (void)BubbleSort:(NSInteger *)arr withLength:(NSInteger)len
{
    int temp = 0;
    for( int i = 0; i < len -1; i ++ )
        for( int j = 1; j < len - i; j++ )
            if( arr[j -1] > arr[j] ){
                temp = arr[j-1];
                arr[j-1] = arr[j];
                arr[j] = temp;
            }
    
}

//퀵정렬
- (void)QuickSort:(NSInteger *)arr withLength:(NSInteger)len
{
    if( len < 2) return;
    int pivot = arr[len/2];
    int *left = arr;
    int *right = arr + len -1;
    int temp = 0;
    while ( left <= right) {
        if( *left < pivot ){ left++; continue;}
        if( *right > pivot ){ right--; continue;}
        temp = *left;
        *left++ = *right;
        *right-- = temp;
    }
    //left 와 right  포인트 변수 값을 활용하여 좌/ 우측의 배열의 길이를 구한다.
    [self QuickSort:arr withLength:right-arr+1];
    [self QuickSort:left withLength:arr+len-left];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSInteger resultIndex;
    NSArray *lTestArr = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D", nil];
    resultIndex = [self LinearSearch:lTestArr withObject:@"B"];
    if( resultIndex > 0 )
        NSLog(@"%@ / index : %d",[lTestArr objectAtIndex:resultIndex],resultIndex);
    else
        NSLog(@"Not Found");
    
    NSInteger bTestArr[] = {0,10,20,30,40,50,60,70,80,90};
    resultIndex = [self BinarySearch:bTestArr withRow:0 withHigh:10 withValue:70];
    if( resultIndex > 0 )
        NSLog(@"%d / index : %d",bTestArr[resultIndex],resultIndex);
    else
        NSLog(@"Not Found");
    
    NSInteger bsTestArr[] = {0,90,20,25,30,50,80,70,10,5};
    //[self BubbleSort:bsTestArr withLength:10];
    [self QuickSort:bsTestArr withLength:10];
    for( int i = 0; i < 10 ; i ++ )
        NSLog(@"%d",bsTestArr[i]);

    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"NakoAlgorithm" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"NakoAlgorithm.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
