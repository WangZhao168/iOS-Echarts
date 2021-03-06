//
//  ScatterDemoController.m
//  iOS-Echarts
//
//  Created by Pluto-Y on 15/11/23.
//  Copyright © 2015年 pluto-y. All rights reserved.
//

#import "ScatterDemoController.h"

typedef NS_ENUM(NSInteger, ScatterDemoTypeBtnTag) {
    ScatterDemoTypeBtnTagBasicScatter = 300001,
    ScatterDemoTypeBtnTagBasicBubble = 300002,
    ScatterDemoTypeBtnTagLargeScaleScatter = 300003,
    ScatterDemoTypeBtnTagCategoryScatter = 300004,
    ScatterDemoTypeBtnTagTimeData = 300005,
    ScatterDemoTypeBtnTagTimeLine = 300006,
    ScatterDemoTypeBtnTagScaleRoaming = 300007,
    ScatterDemoTypeBtnTagScatter = 300008
};

@interface ScatterDemoController ()

@end

@implementation ScatterDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAll];
}

#pragma mark - custom functions
/**
 *  初始化
 */
- (void)initAll {
    self.title = @"散点图";
    [_kEchartView setOption:[PYScatterDemoOptions basicScatterOption]];
    [_kEchartView loadEcharts];
}

/**
 *  按钮点击事件
 */
- (IBAction)kDemoBtnClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    PYOption *option;
    switch (btn.tag) {
        case ScatterDemoTypeBtnTagBasicScatter:
            option = [PYScatterDemoOptions basicScatterOption];
            break;
        case ScatterDemoTypeBtnTagBasicBubble:
            option = [PYScatterDemoOptions basicBubbleOption];
            break;
        case ScatterDemoTypeBtnTagLargeScaleScatter:
            option = [PYScatterDemoOptions largeScaleScatterOption];
            break;
        case ScatterDemoTypeBtnTagCategoryScatter:
            option = [PYScatterDemoOptions categoryScatterOption];
            break;
        case ScatterDemoTypeBtnTagTimeData:
            option = [PYScatterDemoOptions timeDataOption];
            break;
        case ScatterDemoTypeBtnTagTimeLine:
            [self showTimeLineDemo];
            break;
        case ScatterDemoTypeBtnTagScaleRoaming:
            [self showScaleRoamingDemo];
            break;
        case ScatterDemoTypeBtnTagScatter:
            option = [PYScatterDemoOptions scatterOption];
            break;
        default:
            break;
    }
    if (option != nil) {
        [_kEchartView setOption:option];
    }
    [_kEchartView loadEcharts];
}

/**
 *  搭配时间轴
 */
- (void)showTimeLineDemo {
    NSString *json = @"{\"grid\":{\"x\":30,\"x2\":45},\"timeline\":{\"data\":[\"2002-01-01\",\"2003-01-01\",\"2004-01-01\",\"2005-01-01\",\"2006-01-01\",\"2007-01-01\",\"2008-01-01\",\"2009-01-01\",\"2010-01-01\",\"2011-01-01\"],\"label\":{\"formatter\":\"(function(s) {return s.slice(0, 4);})\"},\"autoPlay\":true,\"playInterval\":1000},\"options\":[{\"title\":{\"text\":\"2002全国宏观经济关联分析（GDP vs 房地产）\",\"subtext\":\"数据来自国家统计局\"},\"tooltip\":{\"trigger\":\"axis\",\"showDelay\":0,\"axisPointer\":{\"show\":true,\"type\":\"cross\",\"lineStyle\":{\"type\":\"dashed\",\"width\":1}}},\"toolbox\":{\"show\":true,\"orient\":\"vertical\",\"x\":\"right\",\"y\":\"center\",\"feature\":{\"mark\":{\"show\":true},\"dataView\":{\"show\":true,\"readOnly\":false},\"restore\":{\"show\":true},\"saveAsImage\":{\"show\":true}}},\"grid\":{\"y\":80,\"y2\":100},\"xAxis\":[{\"type\":\"value\",\"name\":\"房地产（亿元）\",\"max\":3400}],\"yAxis\":[{\"type\":\"value\",\"name\":\"GDP（亿元）\",\"max\":53500}],\"series\":[{\"name\":\"GDP\",\"type\":\"scatter\",\"markLine\":{\"data\":[{\"type\":\"average\",\"name\":\"y平均值\",\"itemStyle\":{\"normal\":{\"borderColor\":\"red\"}}},{\"type\":\"average\",\"name\":\"x平均值\",\"valueIndex\":0,\"itemStyle\":{\"normal\":{\"borderColor\":\"red\"}}}]},\"symbolSize\":5,\"itemStyle\":{\"normal\":{\"label\":{\"show\":true,\"formatter\":\"{b}\"}}},\"data\":[{\"name\":\"北京\",\"value\":[298.02,4315]},{\"name\":\"天津\",\"value\":[73.04,2150.76]},{\"name\":\"河北\",\"value\":[140.89,6018.28]},{\"name\":\"山西\",\"value\":[65.83,2324.8]},{\"name\":\"内蒙古\",\"value\":[51.48,1940.94]},{\"name\":\"辽宁\",\"value\":[130.94,5458.22]},{\"name\":\"吉林\",\"value\":[76.11,2348.54]},{\"name\":\"黑龙江\",\"value\":[118.7,3637.2]},{\"name\":\"上海\",\"value\":[384.86,5741.03]},{\"name\":\"江苏\",\"value\":[371.09,10606.85]},{\"name\":\"浙江\",\"value\":[360.63,8003.67]},{\"name\":\"安徽\",\"value\":[139.18,3519.72]},{\"name\":\"福建\",\"value\":[188.09,4467.55]},{\"name\":\"江西\",\"value\":[125.27,2450.48]},{\"name\":\"山东\",\"value\":[371.13,10275.5]},{\"name\":\"河南\",\"value\":[199.31,6035.48]},{\"name\":\"湖北\",\"value\":[145.17,4212.82]},{\"name\":\"湖南\",\"value\":[165.29,4151.54]},{\"name\":\"广东\",\"value\":[808.16,13502.42]},{\"name\":\"广西\",\"value\":[82.83,2523.73]},{\"name\":\"海南\",\"value\":[21.45,642.73]},{\"name\":\"重庆\",\"value\":[90.48,2232.86]},{\"name\":\"四川\",\"value\":[210.82,4725.01]},{\"name\":\"贵州\",\"value\":[53.49,1243.43]},{\"name\":\"云南\",\"value\":[95.68,2312.82]},{\"name\":\"西藏\",\"value\":[3.42,162.04]},{\"name\":\"陕西\",\"value\":[77.68,2253.39]},{\"name\":\"甘肃\",\"value\":[41.52,1232.03]},{\"name\":\"青海\",\"value\":[9.74,340.65]},{\"name\":\"宁夏\",\"value\":[13.46,377.16]},{\"name\":\"新疆\",\"value\":[43.04,1612.6]}]}]},{\"title\":{\"text\":\"2003全国宏观经济关联分析（GDP vs 房地产）\"},\"series\":[{\"data\":[{\"name\":\"北京\",\"value\":[341.88,5007.21]},{\"name\":\"天津\",\"value\":[92.31,2578.03]},{\"name\":\"河北\",\"value\":[185.19,6921.29]},{\"name\":\"山西\",\"value\":[78.73,2855.23]},{\"name\":\"内蒙古\",\"value\":[61.05,2388.38]},{\"name\":\"辽宁\",\"value\":[188.49,6002.54]},{\"name\":\"吉林\",\"value\":[91.99,2662.08]},{\"name\":\"黑龙江\",\"value\":[127.2,4057.4]},{\"name\":\"上海\",\"value\":[487.82,6694.23]},{\"name\":\"江苏\",\"value\":[447.47,12442.87]},{\"name\":\"浙江\",\"value\":[473.16,9705.02]},{\"name\":\"安徽\",\"value\":[162.63,3923.11]},{\"name\":\"福建\",\"value\":[215.84,4983.67]},{\"name\":\"江西\",\"value\":[138.02,2807.41]},{\"name\":\"山东\",\"value\":[418.21,12078.15]},{\"name\":\"河南\",\"value\":[217.58,6867.7]},{\"name\":\"湖北\",\"value\":[176.8,4757.45]},{\"name\":\"湖南\",\"value\":[186.49,4659.99]},{\"name\":\"广东\",\"value\":[955.66,15844.64]},{\"name\":\"广西\",\"value\":[100.93,2821.11]},{\"name\":\"海南\",\"value\":[25.14,713.96]},{\"name\":\"重庆\",\"value\":[113.69,2555.72]},{\"name\":\"四川\",\"value\":[231.72,5333.09]},{\"name\":\"贵州\",\"value\":[59.86,1426.34]},{\"name\":\"云南\",\"value\":[103.79,2556.02]},{\"name\":\"西藏\",\"value\":[4.35,185.09]},{\"name\":\"陕西\",\"value\":[83.9,2587.72]},{\"name\":\"甘肃\",\"value\":[48.09,1399.83]},{\"name\":\"青海\",\"value\":[11.41,390.2]},{\"name\":\"宁夏\",\"value\":[16.85,445.36]},{\"name\":\"新疆\",\"value\":[47.84,1886.35]}]}]},{\"title\":{\"text\":\"2004全国宏观经济关联分析（GDP vs 房地产）\"},\"series\":[{\"data\":[{\"name\":\"北京\",\"value\":[436.11,6033.21]},{\"name\":\"天津\",\"value\":[106.14,3110.97]},{\"name\":\"河北\",\"value\":[231.08,8477.63]},{\"name\":\"山西\",\"value\":[95.1,3571.37]},{\"name\":\"内蒙古\",\"value\":[73.81,3041.07]},{\"name\":\"辽宁\",\"value\":[203.1,6672]},{\"name\":\"吉林\",\"value\":[97.93,3122.01]},{\"name\":\"黑龙江\",\"value\":[137.74,4750.6]},{\"name\":\"上海\",\"value\":[666.3,8072.83]},{\"name\":\"江苏\",\"value\":[534.17,15003.6]},{\"name\":\"浙江\",\"value\":[587.83,11648.7]},{\"name\":\"安徽\",\"value\":[188.28,4759.3]},{\"name\":\"福建\",\"value\":[248.44,5763.35]},{\"name\":\"江西\",\"value\":[167.2,3456.7]},{\"name\":\"山东\",\"value\":[473.27,15021.84]},{\"name\":\"河南\",\"value\":[236.44,8553.79]},{\"name\":\"湖北\",\"value\":[204.8,5633.24]},{\"name\":\"湖南\",\"value\":[191.5,5641.94]},{\"name\":\"广东\",\"value\":[1103.75,18864.62]},{\"name\":\"广西\",\"value\":[122.52,3433.5]},{\"name\":\"海南\",\"value\":[30.64,819.66]},{\"name\":\"重庆\",\"value\":[129.12,3034.58]},{\"name\":\"四川\",\"value\":[264.3,6379.63]},{\"name\":\"贵州\",\"value\":[68.3,1677.8]},{\"name\":\"云南\",\"value\":[116.54,3081.91]},{\"name\":\"西藏\",\"value\":[5.8,220.34]},{\"name\":\"陕西\",\"value\":[95.9,3175.58]},{\"name\":\"甘肃\",\"value\":[56.84,1688.49]},{\"name\":\"青海\",\"value\":[13,466.1]},{\"name\":\"宁夏\",\"value\":[20.78,537.11]},{\"name\":\"新疆\",\"value\":[53.55,2209.09]}]}]},{\"title\":{\"text\":\"2005全国宏观经济关联分析（GDP vs 房地产）\"},\"series\":[{\"data\":[{\"name\":\"北京\",\"value\":[493.73,6969.52]},{\"name\":\"天津\",\"value\":[122.67,3905.64]},{\"name\":\"河北\",\"value\":[330.87,10012.11]},{\"name\":\"山西\",\"value\":[106,4230.53]},{\"name\":\"内蒙古\",\"value\":[98.75,3905.03]},{\"name\":\"辽宁\",\"value\":[256.77,8047.26]},{\"name\":\"吉林\",\"value\":[112.29,3620.27]},{\"name\":\"黑龙江\",\"value\":[163.34,5513.7]},{\"name\":\"上海\",\"value\":[715.97,9247.66]},{\"name\":\"江苏\",\"value\":[799.73,18598.69]},{\"name\":\"浙江\",\"value\":[688.86,13417.68]},{\"name\":\"安徽\",\"value\":[231.66,5350.17]},{\"name\":\"福建\",\"value\":[331.8,6554.69]},{\"name\":\"江西\",\"value\":[171.88,4056.76]},{\"name\":\"山东\",\"value\":[664.9,18366.87]},{\"name\":\"河南\",\"value\":[298.19,10587.42]},{\"name\":\"湖北\",\"value\":[217.17,6590.19]},{\"name\":\"湖南\",\"value\":[215.63,6596.1]},{\"name\":\"广东\",\"value\":[1430.37,22557.37]},{\"name\":\"广西\",\"value\":[165.05,3984.1]},{\"name\":\"海南\",\"value\":[38.2,918.75]},{\"name\":\"重庆\",\"value\":[143.88,3467.72]},{\"name\":\"四川\",\"value\":[286.23,7385.1]},{\"name\":\"贵州\",\"value\":[76.38,2005.42]},{\"name\":\"云南\",\"value\":[148.69,3462.73]},{\"name\":\"西藏\",\"value\":[10.02,248.8]},{\"name\":\"陕西\",\"value\":[108.62,3933.72]},{\"name\":\"甘肃\",\"value\":[63.78,1933.98]},{\"name\":\"青海\",\"value\":[14.1,543.32]},{\"name\":\"宁夏\",\"value\":[22.97,612.61]},{\"name\":\"新疆\",\"value\":[55.79,2604.19]}]}]},{\"title\":{\"text\":\"2006全国宏观经济关联分析（GDP vs 房地产）\"},\"series\":[{\"data\":[{\"name\":\"北京\",\"value\":[658.3,8117.78]},{\"name\":\"天津\",\"value\":[156.64,4462.74]},{\"name\":\"河北\",\"value\":[397.14,11467.6]},{\"name\":\"山西\",\"value\":[117.01,4878.61]},{\"name\":\"内蒙古\",\"value\":[136.5,4944.25]},{\"name\":\"辽宁\",\"value\":[318.54,9304.52]},{\"name\":\"吉林\",\"value\":[131.01,4275.12]},{\"name\":\"黑龙江\",\"value\":[194.7,6211.8]},{\"name\":\"上海\",\"value\":[773.61,10572.24]},{\"name\":\"江苏\",\"value\":[1017.91,21742.05]},{\"name\":\"浙江\",\"value\":[794.41,15718.47]},{\"name\":\"安徽\",\"value\":[281.98,6112.5]},{\"name\":\"福建\",\"value\":[435.22,7583.85]},{\"name\":\"江西\",\"value\":[184.67,4820.53]},{\"name\":\"山东\",\"value\":[786.51,21900.19]},{\"name\":\"河南\",\"value\":[348.7,12362.79]},{\"name\":\"湖北\",\"value\":[294.73,7617.47]},{\"name\":\"湖南\",\"value\":[254.81,7688.67]},{\"name\":\"广东\",\"value\":[1722.07,26587.76]},{\"name\":\"广西\",\"value\":[192.2,4746.16]},{\"name\":\"海南\",\"value\":[44.45,1065.67]},{\"name\":\"重庆\",\"value\":[158.2,3907.23]},{\"name\":\"四川\",\"value\":[336.2,8690.24]},{\"name\":\"贵州\",\"value\":[80.24,2338.98]},{\"name\":\"云南\",\"value\":[165.92,3988.14]},{\"name\":\"西藏\",\"value\":[11.92,290.76]},{\"name\":\"陕西\",\"value\":[125.2,4743.61]},{\"name\":\"甘肃\",\"value\":[73.21,2277.35]},{\"name\":\"青海\",\"value\":[15.17,648.5]},{\"name\":\"宁夏\",\"value\":[25.53,725.9]},{\"name\":\"新疆\",\"value\":[68.9,3045.26]}]}]},{\"title\":{\"text\":\"2007全国宏观经济关联分析（GDP vs 房地产）\"},\"series\":[{\"data\":[{\"name\":\"北京\",\"value\":[821.5,9846.81]},{\"name\":\"天津\",\"value\":[183.44,5252.76]},{\"name\":\"河北\",\"value\":[467.97,13607.32]},{\"name\":\"山西\",\"value\":[134.12,6024.45]},{\"name\":\"内蒙古\",\"value\":[191.01,6423.18]},{\"name\":\"辽宁\",\"value\":[410.43,11164.3]},{\"name\":\"吉林\",\"value\":[153.03,5284.69]},{\"name\":\"黑龙江\",\"value\":[225.81,7104]},{\"name\":\"上海\",\"value\":[958.06,12494.01]},{\"name\":\"江苏\",\"value\":[1365.71,26018.48]},{\"name\":\"浙江\",\"value\":[981.42,18753.73]},{\"name\":\"安徽\",\"value\":[366.57,7360.92]},{\"name\":\"福建\",\"value\":[511.5,9248.53]},{\"name\":\"江西\",\"value\":[225.96,5800.25]},{\"name\":\"山东\",\"value\":[953.69,25776.91]},{\"name\":\"河南\",\"value\":[447.44,15012.46]},{\"name\":\"湖北\",\"value\":[409.65,9333.4]},{\"name\":\"湖南\",\"value\":[301.8,9439.6]},{\"name\":\"广东\",\"value\":[2029.77,31777.01]},{\"name\":\"广西\",\"value\":[239.45,5823.41]},{\"name\":\"海南\",\"value\":[67.19,1254.17]},{\"name\":\"重庆\",\"value\":[196.06,4676.13]},{\"name\":\"四川\",\"value\":[376.84,10562.39]},{\"name\":\"贵州\",\"value\":[93.19,2884.11]},{\"name\":\"云南\",\"value\":[193.59,4772.52]},{\"name\":\"西藏\",\"value\":[13.24,341.43]},{\"name\":\"陕西\",\"value\":[153.98,5757.29]},{\"name\":\"甘肃\",\"value\":[83.52,2703.98]},{\"name\":\"青海\",\"value\":[16.98,797.35]},{\"name\":\"宁夏\",\"value\":[29.49,919.11]},{\"name\":\"新疆\",\"value\":[91.28,3523.16]}]}]},{\"title\":{\"text\":\"2008全国宏观经济关联分析（GDP vs 房地产）\"},\"series\":[{\"data\":[{\"name\":\"北京\",\"value\":[844.59,11115]},{\"name\":\"天津\",\"value\":[227.88,6719.01]},{\"name\":\"河北\",\"value\":[513.81,16011.97]},{\"name\":\"山西\",\"value\":[166.04,7315.4]},{\"name\":\"内蒙古\",\"value\":[273.3,8496.2]},{\"name\":\"辽宁\",\"value\":[500.81,13668.58]},{\"name\":\"吉林\",\"value\":[182.7,6426.1]},{\"name\":\"黑龙江\",\"value\":[244.47,8314.37]},{\"name\":\"上海\",\"value\":[939.34,14069.87]},{\"name\":\"江苏\",\"value\":[1626.13,30981.98]},{\"name\":\"浙江\",\"value\":[1052.03,21462.69]},{\"name\":\"安徽\",\"value\":[431.27,8851.66]},{\"name\":\"福建\",\"value\":[506.98,10823.01]},{\"name\":\"江西\",\"value\":[281.96,6971.05]},{\"name\":\"山东\",\"value\":[1104.95,30933.28]},{\"name\":\"河南\",\"value\":[512.42,18018.53]},{\"name\":\"湖北\",\"value\":[526.88,11328.92]},{\"name\":\"湖南\",\"value\":[340.07,11555]},{\"name\":\"广东\",\"value\":[2057.45,36796.71]},{\"name\":\"广西\",\"value\":[282.96,7021]},{\"name\":\"海南\",\"value\":[95.6,1503.06]},{\"name\":\"重庆\",\"value\":[191.21,5793.66]},{\"name\":\"四川\",\"value\":[453.63,12601.23]},{\"name\":\"贵州\",\"value\":[104.81,3561.56]},{\"name\":\"云南\",\"value\":[195.48,5692.12]},{\"name\":\"西藏\",\"value\":[15.08,394.85]},{\"name\":\"陕西\",\"value\":[193.27,7314.58]},{\"name\":\"甘肃\",\"value\":[93.8,3166.82]},{\"name\":\"青海\",\"value\":[19.96,1018.62]},{\"name\":\"宁夏\",\"value\":[38.85,1203.92]},{\"name\":\"新疆\",\"value\":[89.79,4183.21]}]}]},{\"title\":{\"text\":\"2009全国宏观经济关联分析（GDP vs 房地产）\"},\"series\":[{\"data\":[{\"name\":\"北京\",\"value\":[1062.47,12153.03]},{\"name\":\"天津\",\"value\":[308.73,7521.85]},{\"name\":\"河北\",\"value\":[612.4,17235.48]},{\"name\":\"山西\",\"value\":[173.31,7358.31]},{\"name\":\"内蒙古\",\"value\":[286.65,9740.25]},{\"name\":\"辽宁\",\"value\":[605.27,15212.49]},{\"name\":\"吉林\",\"value\":[200.14,7278.75]},{\"name\":\"黑龙江\",\"value\":[301.18,8587]},{\"name\":\"上海\",\"value\":[1237.56,15046.45]},{\"name\":\"江苏\",\"value\":[2025.39,34457.3]},{\"name\":\"浙江\",\"value\":[1316.84,22990.35]},{\"name\":\"安徽\",\"value\":[497.94,10062.82]},{\"name\":\"福建\",\"value\":[656.61,12236.53]},{\"name\":\"江西\",\"value\":[305.9,7655.18]},{\"name\":\"山东\",\"value\":[1329.59,33896.65]},{\"name\":\"河南\",\"value\":[622.98,19480.46]},{\"name\":\"湖北\",\"value\":[546.11,12961.1]},{\"name\":\"湖南\",\"value\":[400.11,13059.69]},{\"name\":\"广东\",\"value\":[2470.63,39482.56]},{\"name\":\"广西\",\"value\":[348.98,7759.16]},{\"name\":\"海南\",\"value\":[121.76,1654.21]},{\"name\":\"重庆\",\"value\":[229.09,6530.01]},{\"name\":\"四川\",\"value\":[548.14,14151.28]},{\"name\":\"贵州\",\"value\":[136.15,3912.68]},{\"name\":\"云南\",\"value\":[205.14,6169.75]},{\"name\":\"西藏\",\"value\":[13.28,441.36]},{\"name\":\"陕西\",\"value\":[239.92,8169.8]},{\"name\":\"甘肃\",\"value\":[101.37,3387.56]},{\"name\":\"青海\",\"value\":[23.05,1081.27]},{\"name\":\"宁夏\",\"value\":[47.56,1353.31]},{\"name\":\"新疆\",\"value\":[115.23,4277.05]}]}]},{\"title\":{\"text\":\"2010全国宏观经济关联分析（GDP vs 房地产）\"},\"series\":[{\"data\":[{\"name\":\"北京\",\"value\":[1006.52,14113.58]},{\"name\":\"天津\",\"value\":[377.59,9224.46]},{\"name\":\"河北\",\"value\":[697.79,20394.26]},{\"name\":\"山西\",\"value\":[192,9200.86]},{\"name\":\"内蒙古\",\"value\":[309.25,11672]},{\"name\":\"辽宁\",\"value\":[733.37,18457.27]},{\"name\":\"吉林\",\"value\":[212.32,8667.58]},{\"name\":\"黑龙江\",\"value\":[391.89,10368.6]},{\"name\":\"上海\",\"value\":[1002.5,17165.98]},{\"name\":\"江苏\",\"value\":[2600.95,41425.48]},{\"name\":\"浙江\",\"value\":[1618.17,27722.31]},{\"name\":\"安徽\",\"value\":[532.17,12359.33]},{\"name\":\"福建\",\"value\":[679.03,14737.12]},{\"name\":\"江西\",\"value\":[340.56,9451.26]},{\"name\":\"山东\",\"value\":[1622.15,39169.92]},{\"name\":\"河南\",\"value\":[773.23,23092.36]},{\"name\":\"湖北\",\"value\":[564.41,15967.61]},{\"name\":\"湖南\",\"value\":[464.21,16037.96]},{\"name\":\"广东\",\"value\":[2813.95,46013.06]},{\"name\":\"广西\",\"value\":[405.79,9569.85]},{\"name\":\"海南\",\"value\":[188.33,2064.5]},{\"name\":\"重庆\",\"value\":[266.38,7925.58]},{\"name\":\"四川\",\"value\":[558.56,17185.48]},{\"name\":\"贵州\",\"value\":[139.64,4602.16]},{\"name\":\"云南\",\"value\":[223.45,7224.18]},{\"name\":\"西藏\",\"value\":[14.54,507.46]},{\"name\":\"陕西\",\"value\":[315.95,10123.48]},{\"name\":\"甘肃\",\"value\":[110.02,4120.75]},{\"name\":\"青海\",\"value\":[25.41,1350.43]},{\"name\":\"宁夏\",\"value\":[60.53,1689.65]},{\"name\":\"新疆\",\"value\":[143.44,5437.47]}]}]},{\"title\":{\"text\":\"2011全国宏观经济关联分析（GDP vs 房地产）\"},\"series\":[{\"data\":[{\"name\":\"北京\",\"value\":[1074.93,16251.93]},{\"name\":\"天津\",\"value\":[411.46,11307.28]},{\"name\":\"河北\",\"value\":[918.02,24515.76]},{\"name\":\"山西\",\"value\":[224.91,11237.55]},{\"name\":\"内蒙古\",\"value\":[384.76,14359.88]},{\"name\":\"辽宁\",\"value\":[876.12,22226.7]},{\"name\":\"吉林\",\"value\":[238.61,10568.83]},{\"name\":\"黑龙江\",\"value\":[492.1,12582]},{\"name\":\"上海\",\"value\":[1019.68,19195.69]},{\"name\":\"江苏\",\"value\":[2747.89,49110.27]},{\"name\":\"浙江\",\"value\":[1677.13,32318.85]},{\"name\":\"安徽\",\"value\":[634.92,15300.65]},{\"name\":\"福建\",\"value\":[911.16,17560.18]},{\"name\":\"江西\",\"value\":[402.51,11702.82]},{\"name\":\"山东\",\"value\":[1838.14,45361.85]},{\"name\":\"河南\",\"value\":[987,26931.03]},{\"name\":\"湖北\",\"value\":[634.67,19632.26]},{\"name\":\"湖南\",\"value\":[518.04,19669.56]},{\"name\":\"广东\",\"value\":[3321.31,53210.28]},{\"name\":\"广西\",\"value\":[465.68,11720.87]},{\"name\":\"海南\",\"value\":[208.71,2522.66]},{\"name\":\"重庆\",\"value\":[396.28,10011.37]},{\"name\":\"四川\",\"value\":[620.62,21026.68]},{\"name\":\"贵州\",\"value\":[160.3,5701.84]},{\"name\":\"云南\",\"value\":[222.31,8893.12]},{\"name\":\"西藏\",\"value\":[17.44,605.83]},{\"name\":\"陕西\",\"value\":[398.03,12512.3]},{\"name\":\"甘肃\",\"value\":[134.25,5020.37]},{\"name\":\"青海\",\"value\":[29.05,1670.44]},{\"name\":\"宁夏\",\"value\":[79.01,2102.21]},{\"name\":\"新疆\",\"value\":[176.22,6610.05]}]}]}]}";
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    PYOption *option = [RMMapper objectWithClass:[PYOption class] fromDictionary:jsonDic];
    [_kEchartView setOption:option];
}

/**
 *  搭配值域漫游
 */
- (void)showScaleRoamingDemo {
    NSString *json = @"{\"grid\":{\"x\":40,\"x2\":45},\"tooltip\":{\"trigger\":\"item\"},\"toolbox\":{\"show\":true,\"feature\":{\"mark\":{\"show\":true},\"dataZoom\":{\"show\":true},\"dataView\":{\"show\":true,\"readOnly\":false},\"restore\":{\"show\":true},\"saveAsImage\":{\"show\":true}}},\"dataRange\":{\"show\":true,\"min\":0,\"max\":100,\"y\":\"center\",\"text\":[\"高\",\"低\"],\"color\":[\"lightgreen\",\"yellow\"],\"calculable\":true},\"xAxis\":[{\"type\":\"value\",\"scale\":true}],\"yAxis\":[{\"type\":\"value\",\"position\":\"right\",\"scale\":true}],\"animation\":false,\"series\":[{\"name\":\"scatter1\",\"type\":\"scatter\",\"symbolSize\":5,\"data\":\"(function () {var d = [];var len = 500;var value;while (len--) {value = (Math.random()*100).toFixed(2) - 0;d.push([(Math.random()*value + value).toFixed(2) - 0,(Math.random()*value).toFixed(2) - 0,value]);}return d;})()\"}]}";
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    PYOption *option = [RMMapper objectWithClass:[PYOption class] fromDictionary:jsonDic];
    [_kEchartView setOption:option];
}

@end
