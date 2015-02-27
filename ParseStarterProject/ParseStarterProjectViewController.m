//
//  ParseStarterProjectViewController.m
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import "ParseStarterProjectViewController.h"

#import <Parse/Parse.h>

@implementation ParseStarterProjectViewController

#pragma mark -
#pragma mark UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Set the textfield to determine how many PFObjects will be created
    self.textField.text = @"100";
    [self.button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonPressed {
    
    NSMutableArray* mutableArray = [[NSMutableArray alloc] init];
    int x = self.textField.text.intValue;
    PFObject* previousTestObject;
    for (int i = 0; i < x; i++) {
        
        PFObject* testObject = [PFObject objectWithClassName:@"TestObject"];
        
        // Give the object data to store
        
        PFACL* acl = [PFACL ACL];
        [acl setPublicReadAccess:YES];
        [acl setPublicReadAccess:YES];
        testObject.ACL = acl;
        
        testObject[@"one"] = @"1";
        testObject[@"two"] = @"2";
        testObject[@"three"] = @"3";
        testObject[@"four"] = @"4";
        testObject[@"five"] = @"5";
        testObject[@"six"] = @"6";
        testObject[@"seven"] = @"7";
        testObject[@"eight"] = @"8";
        testObject[@"nine"] = @"9";
        
        // Give the object a pointer to store
        // This is what causes the memory issues - if you comment this out there will be no memory issues
        // If you save 10 objects at once there is only a small memory spike - with the iPhone 5 it is about 0.3 MB
        // Saving 25 objects at once: 1 MB memory spike
        // Saving 50 objects at once: 2 MB memory spike
        // Saving 100 objects at once: 20 MB memory spike
        // Saving 200 objects at once: 95 MB memory spike
        
        if (previousTestObject) {
            
            testObject[@"previousTestObject"] = previousTestObject;
            
        }
        
        // add the test object to them mutable array
        
        [mutableArray addObject:testObject];
        
        previousTestObject = testObject;
        
    }
    
    [PFObject saveAllInBackground:mutableArray block:^(BOOL succeeded, NSError *error) {
        
        if (succeeded) {
            
            NSLog(@"Succeeded - check memory usage");
            
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
