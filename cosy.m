/**
 * 实用的功能代码
 */

#ifdef DEBUG // 调试状态, 打开LOG功能
#define WJLog(...) NSLog(__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
#define WJLog(...)

// 颜色
#define WJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define WJRandomColor WJColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 全局背景色
#define WJGlobalBg WJColor(211, 211, 211)

// 是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 是否为4inch
#define FourInch ([UIScreen mainScreen].bounds.size.height == 568.0)

// 导航栏标题的字体
#define WJNavigationTitleFont [UIFont boldSystemFontOfSize:20]

// 应用信息
#define WJAppKey @""
#define WJAppSecret @""
#define WJRedirectURI @""

// 屏幕尺寸
#define WJScreenW [UIScreen mainScreen].bounds.size.width

// cell的计算参数
// cell之间的间距
#define WJStatusCellMargin 10

// cell的内边距
#define WJStatusCellInset 10
