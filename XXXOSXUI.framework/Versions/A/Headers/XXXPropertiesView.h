//
//  XXXPropertiesView.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/11/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "JUInspectorViewContainer.h"
@protocol XXXPropertiesViewDataSource;
@interface XXXPropertiesView : JUInspectorViewContainer
@property(nonatomic,strong)id <XXXPropertiesViewDataSource>dataSource;
@property(nonatomic,strong)id bindObj;
- (void)reloadData;
- (void)registerFormClass:(Class)formClass;
@end
@protocol XXXPropertiesViewDataSource<NSObject>
@optional
- (NSInteger)propertiesView:(JUInspectorViewContainer *__unused)propertiesView numberOfChildrenOfItem:(id)item;
- (id)propertiesView:(JUInspectorViewContainer *__unused)propertiesView child:(NSInteger)index ofItem:(id)item;
- (id)propertiesView:(JUInspectorViewContainer *__unused)propertiesView objectValueForItem:(id)item;
@end
