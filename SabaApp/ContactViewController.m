//
//  ContactViewController.m
//  SabaApp
//
//  Created by Syed Naqvi on 4/26/15.
//  Copyright (c) 2015 Naqvi. All rights reserved.
//

#import "ContactViewController.h"
#import "AppDelegate.h"

#import "CustomAnnotation.h"
#import "SabaClient.h"

@interface ContactViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupNavigationBar];
	[self setupMapview];
}

#pragma mark Delegate Methods

// calloutAccessoryControlTapped
//-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
//	
//	// we might not need this.
//	id <MKAnnotation> annotation = [view annotation];
//	if ([annotation isKindOfClass:[MKPointAnnotation class]])
//	{
//		NSLog(@"Clicked Pizza Shop");
//	}
//	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Disclosure Pressed" message:@"Click Cancel to Go Back" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//	[alertView show];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
	if([annotation isKindOfClass:[CustomAnnotation class]]){
		CustomAnnotation *myLocation = (CustomAnnotation*)annotation;
		MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"MyCustomAnnotation"];
		if(annotationView == nil){
			annotationView = myLocation.annotationView;
		} else {
			annotationView.annotation = annotation;
		}
		
		return annotationView;
	}
	return nil;
}

-(void) setupMapview{
	self.mapView.delegate = self;
	
	// Saba location's lat & long
	double latitude = 37.421177;
	double longitude = -121.958697;
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	
	span.latitudeDelta =0.005;
	span.longitudeDelta =0.005;
	
	CLLocationCoordinate2D location = self.mapView.userLocation.coordinate;
	
	location.latitude = latitude;
	location.longitude = longitude;
	
	region.span = span;
	region.center = location;
	
	CustomAnnotation *customAnnotation = [[CustomAnnotation alloc] initWithTitle:@"Saba Islamic Center" Location:location];
	if (customAnnotation !=nil) {
		[self.mapView removeAnnotation:customAnnotation];
	}
	
	[self.mapView addAnnotation:customAnnotation];
	[self.mapView selectAnnotation:customAnnotation animated:YES];
	
	[self.mapView setRegion:region animated:TRUE];
	[self.mapView regionThatFits:region];
}

-(void) setupNavigationBar{
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"backArrowIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(onBack)];
	
	[[SabaClient sharedInstance] setupNavigationBarFor:self];
	
	self.navigationItem.title = @"Contact and Directions";
}

-(void) onBack{
	[self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
