//
//  DailyScheduleViewController.m
//  SabaApp
//
//  Created by Syed Naqvi on 5/3/15.
//  Copyright (c) 2015 Naqvi. All rights reserved.
//

#import "DailyScheduleViewController.h"

// Third party imports
#import <SVProgressHUD.h>

#import "DailyProgram.h"
#import "DailyProgramCell.h"

@interface DailyScheduleViewController ()<UITableViewDelegate,
											UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DailyScheduleViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	
	// tableView delegate and source
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	
	[self setupNavigationBar];
	
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	
	// register cell for TableView
	[self.tableView registerNib:[UINib nibWithNibName:@"DailyProgramCell" bundle:nil] forCellReuseIdentifier:@"DailyProgramCell"];
}

-(void)setPrograms:(NSArray *)programs{
	_programs = programs;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(void) setupNavigationBar{
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"backArrowIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(onBack)];
	
	self.navigationItem.title = @"Daily Schedule";
}

-(void) onBack{
	[self dismissViewControllerAnimated:YES completion:nil];
	//[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark TableView

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	DailyProgramCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"DailyProgramCell" forIndexPath:indexPath];
	[cell setProgram:self.programs[indexPath.row]];
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.programs.count;
}

@end
