### UINavigationBar-BottomLine
设置导航栏的背景色, 半透明层, 去除烦人的分割线

### 简介
原先只是想去除UINavigationBar的分割线的, 但感觉只去除分割线, 并不好看, 后来就添加上了自定义半透明层, 和全透明

### 既有方法
```
//隐藏导航栏的分割线
- (void)bottomLineHidden:(BOOL)isBottomLineHidden;

//设置导航栏的分割线的透明度
- (void)bottomLineAlpha:(CGFloat)alpha;

//自定义导航栏的半透明特效
//特效: 系统默认, 系统白, 系统黑, 清除特效(全透明)
- (void)effectViewCustom:(effectViewCustomStyle)effectViewCustom;

//设置导航栏的背景颜色
- (void)NavBackgroundColor:(UIColor *)backgroundColor;

//还原默认值
- (void)NavReset;
```

### 使用方法
```
//隐藏分割线
[self.navigationController.navigationBar bottomLineHidden:YES];
	
//去除半透明透明层
[self.navigationController.navigationBar effectViewCustom:effectViewCustomClear];
    
//设置带有透明效果的背景色
[self.navigationController.navigationBar NavBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0]];
```
