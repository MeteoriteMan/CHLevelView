# CHLevelView
## 效果
![](https://github.com/MeteoriteMan/Assets/blob/master/gif/CHLevelView-iPhone%208.gif?raw=true)

## 使用

```
	self.viewLevelStart = [[CHLevelView alloc] init];
	self.viewLevelStart.allowGestureRecognizer = YES;
	self.viewLevelStart.starNumber = 4;
	[self.view addSubview:self.viewLevelStart];
	[self.viewLevelStart mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.offset(100);
		make.centerX.equalTo(self.view);
		make.height.offset(70);
	}];
	[_viewLevelStart setLevel:2];
	
```
**注:**宽度自适应控件高度,宽度无需设置

## 安装

直接下载导入即可

>`#import "CHLevelView.h"`

## 更新记录

|版本|更新内容|
|:--|:--|
|0.0.1|支持设置是否允许用户交互|
