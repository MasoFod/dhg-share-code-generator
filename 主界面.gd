extends Control

@onready var 中文: CheckBox = $VBoxContainer/语言选择/中文
@onready var 英文: CheckBox = $VBoxContainer/语言选择/英文
@onready var 类型选择菜单: MenuButton = $VBoxContainer/属性设置/类型选择/类型选择
@onready var 稀有度选择菜单: MenuButton = $VBoxContainer/属性设置/稀有度选择/稀有度选择
@onready var 名称选择菜单: MenuButton = $VBoxContainer/属性设置/物品名称/名称选择
@onready var 词条1: HBoxContainer = $VBoxContainer/属性设置/词条/词条1
@onready var 词条2: HBoxContainer = $VBoxContainer/属性设置/词条/词条2
@onready var 词条3: HBoxContainer = $VBoxContainer/属性设置/词条/词条3
@onready var 词条4: HBoxContainer = $VBoxContainer/属性设置/词条/词条4
@onready var 词条5: HBoxContainer = $VBoxContainer/属性设置/词条/词条5
@onready var 代码: TextEdit = $VBoxContainer/代码

# 物品属性
@export var property: Dictionary = {
	"propertyType": "",
	"quality": 0,
	"sharer": "",
	"shareWords": "",
	"badgeName": "", # 圣物名称
	"supportSlateName": "", # 增幅石板名称
	"coreName": "", # 猎场核心名称
	"affixJsons":[
		{
		"affixName":"",
		"isCompositeAffix":false,
		"quality":0,
		"convertType":0,
		"num":0.1,
		"deeplyChaosed":false},
		{
		"affixName":"",
		"isCompositeAffix":false,
		"quality":0,
		"convertType":0,
		"num":0.1,
		"deeplyChaosed":false},
		{
		"affixName":"",
		"isCompositeAffix":false,
		"quality":0,
		"convertType":0,
		"num":0.1,
		"deeplyChaosed":false},
		{
		"affixName":"",
		"isCompositeAffix":false,
		"quality":0,
		"convertType":0,
		"num":0.1,
		"deeplyChaosed":false},
		{
		"affixName":"",
		"isCompositeAffix":false,
		"quality":0,
		"convertType":0,
		"num":0.1,
		"deeplyChaosed":false}],
	"powerNames":["","","","",""],
}

const 圣物名称列表: Array[String] = [
	"爆炸宝珠",
	"霜冻宝珠",
	"电流宝珠",
	"伫足圣纹",
	"守护",
	"弥漫之息",
	"鬣齿",
	"无孔圣纹",
	"侵蚀圣纹",
	"噬血尖牙",
	"毒蛛",
	"铁壁圣纹",
	"持久圣纹",
	"忍耐圣纹",
	"迫害",
	"崩碎",
	"永霜头冠",
	"舞者面纱",
	"威胁之链",
	"结晶棱镜",
	"虫瓶",
	"守护契约",
	"架势圣纹",
	"翼刃",
	"灵矢",
	"集众之愿",
	"收藏家手环",
	"平凡信仰",
	"疯狂面具",
	"渴血屠刀",
	"噬能",
	"逐星",
	"腐蚀之心",
	"碎体利刃",
	"密谋之影",
	"召唤契约",
	"天体中心",
	"破败头颅",
	"陷阵大剑",
	"屠戮巨斧",
	"陷阵者之甲",
	"潮汐典籍",
	"陨星秘戒",
	"能守长袍",
	"降临之面",
	"鹰眼",
	"华美月刃",
	"坠星之矢",
	"舞娘华服",
	"影狐长枪",
	"暗杀者的碎刃",
	"千钧一发",
	"元素契约",
	"王者契约",
	"燃烧契约",
	"电气瓶",
	"幸运叶",
	"混乱之戒",
	"极端天平",
	"永恒守护",
	"极限原则",
	"针管",
	"灵刃",
	"绽放",
	"聚能棱晶",
	"污染契约",
	"血之握",
	"光辉羽翼",
	"影之玉",
	"符印苦无",
	"裂地巨锤",
	"灵锤",
	"圣印",
	"荆棘十字架",
	"圣战链甲",
	"双生",
	"重岩",
	"无定蓑衣",
	"愤怒之环",
	"仙猿酒",
	"舍身",]
const 增幅石板名称列表: Array[String] = [
	"蓄力",
	"放大",
	"快速",
	"纯粹",
	"冰霜",
	"火焰",
	"闪电",
	"多重投射",
	"能量占用",
	"节能",
	"凝聚",
	"快速冷却",
	"持久",
	"缩短",
	"充能",
	"自动",
	"永久召唤",
	"受击时释放",
	"击中时释放",
	"召唤物释放",
	"锁定",
	"能量倾泻",
	"狂怒",
	"急速",
	"屏障",
	"调律",
	"汲能",
	"能量灌注",
	"血气",
	"冰冻",
	"雷击",
	"引爆",
	"多重攻击",
	"破甲",
	"暴击几率",
	"暴击伤害",
	"治愈",
	"击退",
	"弹幕",
	"分享",
	"灵体战士",
	"多重召唤",
	"毒素",
	"电弧",
	"元素异常",
	"践踏",
	"袖箭",
	"械动炮台",
	"能量结晶",
	"超量释放",
	"狂怒释放",
	"霰弹装填",
	"元素瓦解",
	"冲锋",
	"弱点突破",
	"熔火",
	"自动召唤",
	"接力",
	"连锁",
	"附着爆弹",]
const 猎场核心名称列表: Array[String] = [
	"精英诱饵",
	"群落吸引",
	"搜集物品",
	"经验丰富",
	"财富猎手",
	"奖励升级",
	"小型收割",
	"精英收割",
	"双魔成行",
	"气息追猎",
	"异化个体",
	"异化精英",
	"持久鏖战",
	"深渊猎手",
	"混沌提炼",
	"混沌畸变",]
const 圣物词条列表: Array[Dictionary] = [
	{"affixName": "最大生命",
	"显示名称":"最大生命（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "最大生命",
	"显示名称":"最大生命（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "召唤物最大生命",
	"显示名称":"召唤物最大生命（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "最大能量",
	"显示名称":"最大能量（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "最大能量",
	"显示名称":"最大能量（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "每秒生命恢复",
	"显示名称":"生命每秒恢复（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "每秒生命恢复百分比",
	"显示名称":"每秒恢复生命（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "召唤物每秒生命恢复百分比",
	"显示名称":"召唤物每秒恢复生命（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "每秒能量恢复",
	"显示名称":"每秒能量恢复（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "每秒能量恢复百分比",
	"显示名称":"每秒恢复能量（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "格挡率",
	"显示名称":"格挡率（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "闪避率",
	"显示名称":"闪避率（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "暴击率",
	"显示名称":"暴击率（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "暴击伤害",
	"显示名称":"暴击伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "格挡减伤",
	"显示名称":"格挡减伤（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "点燃抗性",
	"显示名称":"点燃抗性（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "冰缓抗性",
	"显示名称":"冰缓抗性（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "感电抗性",
	"显示名称":"感电抗性（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "点燃概率",
	"显示名称":"点燃概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "冰缓概率",
	"显示名称":"冰缓概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "感电概率",
	"显示名称":"感电概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "点燃效果",
	"显示名称":"点燃效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "冰缓效果",
	"显示名称":"冰缓效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "感电效果",
	"显示名称":"感电效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "普通防御",
	"显示名称":"普通防御（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "火焰防御",
	"显示名称":"火焰防御（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "冰霜防御",
	"显示名称":"冰霜防御（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "闪电防御",
	"显示名称":"闪电防御（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "移动速度",
	"显示名称":"移动速度（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "额外普通伤害减免",
	"显示名称":"普通伤害减免（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "额外火焰伤害减免",
	"显示名称":"火焰伤害减免（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "额外冰霜伤害减免",
	"显示名称":"冰霜伤害减免（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "额外闪电伤害减免",
	"显示名称":"闪电伤害减免（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "普通防御上限",
	"显示名称":"普通防御上限（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "火焰防御上限",
	"显示名称":"火焰防御上限（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "冰霜防御上限",
	"显示名称":"冰霜防御上限（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "闪电防御上限",
	"显示名称":"闪电防御上限（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "药剂效果",
	"显示名称":"药剂效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "药剂持续时间延长",
	"显示名称":"药剂持续时间（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "药剂冷却回复速度",
	"显示名称":"药剂冷却回复速度（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "狂怒层数上限",
	"显示名称":"狂怒层数上限（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "专注层数上限",
	"显示名称":"专注层数上限（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "急速层数上限",
	"显示名称":"急速层数上限（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "狂怒效果",
	"显示名称":"狂怒效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "急速效果",
	"显示名称":"急速效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "能量灌注效果",
	"显示名称":"能量灌注效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "专注效果",
	"显示名称":"专注效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "破甲效果",
	"显示名称":"破甲效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "普通伤害",
	"显示名称":"普通伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "火焰伤害",
	"显示名称":"火焰伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "冰霜伤害",
	"显示名称":"冰霜伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "闪电伤害",
	"显示名称":"闪电伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "技能速度",
	"显示名称":"技能速度（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "召唤物移动速度",
	"显示名称":"召唤物移动速度（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "召唤物持续时间",
	"显示名称":"召唤物持续时间（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "毒素持续时间",
	"显示名称":"毒素持续时间（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "最大精神力",
	"显示名称":"最大精神力（20）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "持续伤害加剧效果",
	"显示名称":"持续伤害加剧效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "持续伤害生效速度",
	"显示名称":"持续伤害生效速度（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "能量承伤比例",
	"显示名称":"受到伤害由能量承受（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "承受元素伤害视作普通伤害",
	"显示名称":"受到元素伤害被视作普通伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "漆黑之力效果",
	"显示名称":"漆黑之树承载力量效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "专注层数下限",
	"显示名称":"专注层数下限（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "暴击伤害穿透防御力",
	"显示名称":"暴击伤害穿透防御（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "元素异常产生额外伤害修正",
	"显示名称":"元素异常增伤（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "额外毒素概率",
	"显示名称":"施加毒素额外施加概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "额外加剧上限",
	"显示名称":"持续伤害加剧上限（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "初始加剧",
	"显示名称":"持续伤害初始加剧（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "破甲层数上限",
	"显示名称":"破甲层数上限（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "忍耐层数上限",
	"显示名称":"忍耐层数上限（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "元素防御",
	"显示名称":"元素防御（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "伤害",
	"显示名称":"伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "元素伤害",
	"显示名称":"元素伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "近战伤害",
	"显示名称":"近战伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "范围伤害",
	"显示名称":"范围伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "投射物伤害",
	"显示名称":"投射物伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "召唤物伤害",
	"显示名称":"召唤物伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "效果范围",
	"显示名称":"效果范围（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "近战攻击范围",
	"显示名称":"近战攻击范围（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "元素异常持续时间",
	"显示名称":"元素异常持续时间（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "冷却回复速度",
	"显示名称":"冷却回复速度（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "召唤物全部防御",
	"显示名称":"召唤物全部防御（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "召唤物元素异常抗性",
	"显示名称":"召唤物元素异常抗性（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "药剂生命与能量恢复效果",
	"显示名称":"药剂生命与能量恢复效果（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "元素防御上限",
	"显示名称":"元素防御上限（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "额外伤害减免",
	"显示名称":"伤害减免（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "全部防御",
	"显示名称":"全部防御（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},]
const 增幅石板词条列表: Array[Dictionary] = [
	{"affixName": "技能强度",
	"显示名称":"技能强度（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "普通伤害",
	"显示名称":"普通伤害（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "火焰伤害",
	"显示名称":"火焰伤害（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "冰霜伤害",
	"显示名称":"冰霜伤害（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "闪电伤害",
	"显示名称":"闪电伤害（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "普通伤害",
	"显示名称":"普通伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "火焰伤害",
	"显示名称":"火焰伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "冰霜伤害",
	"显示名称":"冰霜伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "闪电伤害",
	"显示名称":"闪电伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "技能速度",
	"显示名称":"技能速度（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "暴击率",
	"显示名称":"暴击率（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "暴击伤害",
	"显示名称":"暴击伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "召唤物移动速度",
	"显示名称":"召唤物移动速度（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "召唤物持续时间",
	"显示名称":"召唤物持续时间（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "召唤物最大生命",
	"显示名称":"召唤物最大生命（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "技能击中时恢复生命",
	"显示名称":"技能击中时恢复生命（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "技能击中时恢复能量",
	"显示名称":"技能击中时恢复能量（数值）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "持续伤害加剧效果",
	"显示名称":"持续伤害加剧效果（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "持续伤害生效速度",
	"显示名称":"持续伤害生效速度（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "普通伤害",
	"显示名称":"普通伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 2},
	{"affixName": "火焰伤害",
	"显示名称":"火焰伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 2},
	{"affixName": "冰霜伤害",
	"显示名称":"冰霜伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 2},
	{"affixName": "闪电伤害",
	"显示名称":"闪电伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 2},
	{"affixName": "概率额外近战攻击次数",
	"显示名称":"概率额外近战攻击次数（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "概率额外投射物",
	"显示名称":"概率额外投射物（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "技能强度",
	"显示名称":"技能强度（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "召唤物数量上限",
	"显示名称":"技能强度（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "每次召唤的召唤物数量",
	"显示名称":"技能强度（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "暴击率",
	"显示名称":"暴击率（百分比）",
	"isCompositeAffix": false,
	"convertType": 2},
	{"affixName": "暴击伤害",
	"显示名称":"暴击伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 2},
	{"affixName": "投射物连锁次数",
	"显示名称":"投射物连锁次数（1）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "冷却回复速度",
	"显示名称":"冷却回复速度（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "伤害",
	"显示名称":"伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "元素伤害",
	"显示名称":"元素伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "近战伤害",
	"显示名称":"近战伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "范围伤害",
	"显示名称":"范围伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "投射物伤害",
	"显示名称":"投射物伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "召唤物伤害",
	"显示名称":"召唤物伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "元素异常概率",
	"显示名称":"元素异常概率（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "元素异常效果",
	"显示名称":"元素异常效果（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "技能效果持续时间",
	"显示名称":"技能效果持续时间（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "召唤物全部防御",
	"显示名称":"召唤物全部防御（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "召唤物元素异常抗性",
	"显示名称":"召唤物元素异常抗性（百分比）",
	"isCompositeAffix": true,
	"convertType": 0},
	{"affixName": "技能的能量消耗",
	"显示名称":"技能的能量消耗（负数百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "效果范围",
	"显示名称":"效果范围（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "近战攻击范围",
	"显示名称":"近战攻击范围（百分比）",
	"isCompositeAffix": true,
	"convertType": 1},
	{"affixName": "近战伤害",
	"显示名称":"近战伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 2},
	{"affixName": "范围伤害",
	"显示名称":"范围伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 2},
	{"affixName": "投射物伤害",
	"显示名称":"投射物伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 2},
	{"affixName": "召唤物伤害",
	"显示名称":"召唤物伤害（百分比）",
	"isCompositeAffix": true,
	"convertType": 2},]
const 猎场核心词条列表: Array[Dictionary] = [
	{"affixName": "击杀普通怪物增加的进度",
	"显示名称":"击杀普通怪物增加的进度（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "普通怪物物品掉落概率",
	"显示名称":"普通怪物物品掉落概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "精英怪物物品掉落概率",
	"显示名称":"精英怪物物品掉落概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "普通怪物掉落经验数量",
	"显示名称":"普通怪物掉落经验数量（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "精英怪物掉落经验数量",
	"显示名称":"精英怪物掉落经验数量（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "普通怪物掉落虚空之息数量",
	"显示名称":"普通怪物掉落虚空之息数量（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "精英怪物掉落虚空之息数量",
	"显示名称":"精英怪物掉落虚空之息数量（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "普通怪物被强化概率",
	"显示名称":"普通怪物被强化概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "精英怪物被强化概率",
	"显示名称":"精英怪物被强化概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "怪物群规模",
	"显示名称":"怪物群规模（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "物品升阶概率",
	"显示名称":"物品升阶概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "精英怪物掉落特殊气息数量",
	"显示名称":"精英怪物掉落特殊气息数量（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "事件出现概率",
	"显示名称":"事件出现概率（百分比）",
	"isCompositeAffix": false,
	"convertType": 1},
	{"affixName": "怪物伤害",
	"显示名称":"怪物伤害（负数百分比）",
	"isCompositeAffix": false,
	"convertType": 2},
	{"affixName": "怪物承受伤害",
	"显示名称":"怪物承受伤害（百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "怪物普通抗性",
	"显示名称":"怪物普通抗性（负数百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "怪物火焰抗性",
	"显示名称":"怪物火焰抗性（负数百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "怪物冰霜抗性",
	"显示名称":"怪物冰霜抗性（负数百分比）",
	"isCompositeAffix": false,
	"convertType": 0},
	{"affixName": "怪物闪电抗性",
	"显示名称":"怪物闪电抗性（负数百分比）",
	"isCompositeAffix": false,
	"convertType": 0},]
const 深渊之眼词条列表: Array = [
	"陷阵者",
	"屠夫",
	"血肉浮屠",
	"狂怒者",
	"钢铁战士",
	"盾卫",
	"神射手",
	"舞者",
	"狙击手",
	"多矢手",
	"灵巧猎手",
	"毒素大师",
	"破甲大师",
	"暗杀者",
	"致命杀手",
	"心眼武士",
	"元素使",
	"毁灭使",
	"能量学者",
	"观察者",
	"元素眷属",
	"火焰化身",
	"收藏家",
	"纵火家",
	"咒术师",
	"召唤大师",
	"灵魂使",
	"死灵术士",
	"萨满",
	"发条人",
	"药剂师",
	"黑树侍卫",
	"熵变学者",
	"霜主",
	"电涌之灵",
	"智者",]


# 初始化
func _ready() -> void:
	var 类型选择: PopupMenu  = 类型选择菜单.get_popup()
	类型选择.id_pressed.connect(_on_类型选择_pressed)
	var 稀有度选择: PopupMenu = 稀有度选择菜单.get_popup()
	稀有度选择.id_pressed.connect(_on_稀有度选择_pressed)
	var 名称选择: PopupMenu = 名称选择菜单.get_popup()
	名称选择.id_pressed.connect(_on_名称选择_pressed)
	var 词条1选择: PopupMenu = 词条1.get_child(1).get_child(0).get_popup()
	词条1选择.id_pressed.connect(_on_词条1_pressed)
	var 词条2选择: PopupMenu = 词条2.get_child(1).get_child(0).get_popup()
	词条2选择.id_pressed.connect(_on_词条2_pressed)
	var 词条3选择: PopupMenu = 词条3.get_child(1).get_child(0).get_popup()
	词条3选择.id_pressed.connect(_on_词条3_pressed)
	var 词条4选择: PopupMenu = 词条4.get_child(1).get_child(0).get_popup()
	词条4选择.id_pressed.connect(_on_词条4_pressed)
	var 词条5选择: PopupMenu = 词条5.get_child(1).get_child(0).get_popup()
	词条5选择.id_pressed.connect(_on_词条5_pressed)
	var 词条1稀有度选择: PopupMenu = 词条1.get_child(1).get_child(1).get_popup()
	词条1稀有度选择.id_pressed.connect(_on_词条1稀有度_pressed)
	var 词条2稀有度选择: PopupMenu = 词条2.get_child(1).get_child(1).get_popup()
	词条2稀有度选择.id_pressed.connect(_on_词条2稀有度_pressed)
	var 词条3稀有度选择: PopupMenu = 词条3.get_child(1).get_child(1).get_popup()
	词条3稀有度选择.id_pressed.connect(_on_词条3稀有度_pressed)
	var 词条4稀有度选择: PopupMenu = 词条4.get_child(1).get_child(1).get_popup()
	词条4稀有度选择.id_pressed.connect(_on_词条4稀有度_pressed)
	var 词条5稀有度选择: PopupMenu = 词条5.get_child(1).get_child(1).get_popup()
	词条5稀有度选择.id_pressed.connect(_on_词条5稀有度_pressed)
	var 词条1混沌化: CheckBox = 词条1.get_child(1).get_child(2)
	词条1混沌化.pressed.connect(_on_词条1混沌化_pressed)
	var 词条2混沌化: CheckBox = 词条2.get_child(1).get_child(2)
	词条2混沌化.pressed.connect(_on_词条2混沌化_pressed)
	var 词条3混沌化: CheckBox = 词条3.get_child(1).get_child(2)
	词条3混沌化.pressed.connect(_on_词条3混沌化_pressed)
	var 词条4混沌化: CheckBox = 词条4.get_child(1).get_child(2)
	词条4混沌化.pressed.connect(_on_词条4混沌化_pressed)
	var 词条5混沌化: CheckBox = 词条5.get_child(1).get_child(2)
	词条5混沌化.pressed.connect(_on_词条5混沌化_pressed)


# 语言选择
func _on_中文_pressed() -> void:
	if 中文.button_pressed:
		return
	英文.button_pressed = false
	TranslationServer.set_locale("ch")

func _on_英文_pressed() -> void:
	if 英文.button_pressed:
		return
	中文.button_pressed = false
	TranslationServer.set_locale("en")

# 类型选择
func _on_类型选择_pressed(id: int) -> void:
	var popup_menu_item_name: PopupMenu = 名称选择菜单.get_popup()
	var popup_menu_affix_name1: PopupMenu = 词条1.get_child(1).get_child(0).get_popup()
	var popup_menu_affix_name2: PopupMenu = 词条2.get_child(1).get_child(0).get_popup()
	var popup_menu_affix_name3: PopupMenu = 词条3.get_child(1).get_child(0).get_popup()
	var popup_menu_affix_name4: PopupMenu = 词条4.get_child(1).get_child(0).get_popup()
	var popup_menu_affix_name5: PopupMenu = 词条5.get_child(1).get_child(0).get_popup()
	match id:
		0:
			类型选择菜单.text = "圣物"
			property["propertyType"] = "圣物"
			popup_menu_item_name.clear(true)
			popup_menu_affix_name1.clear(true)
			popup_menu_affix_name2.clear(true)
			popup_menu_affix_name3.clear(true)
			popup_menu_affix_name4.clear(true)
			popup_menu_affix_name5.clear(true)
			for item_name in 圣物名称列表:
				popup_menu_item_name.add_item(item_name)
			for affix_info in 圣物词条列表:
				popup_menu_affix_name1.add_item(affix_info["显示名称"])
				popup_menu_affix_name2.add_item(affix_info["显示名称"])
				popup_menu_affix_name3.add_item(affix_info["显示名称"])
				popup_menu_affix_name4.add_item(affix_info["显示名称"])
				popup_menu_affix_name5.add_item(affix_info["显示名称"])
		1:
			类型选择菜单.text = "增幅石板"
			property["propertyType"] = "增幅石板"
			popup_menu_item_name.clear(true)
			popup_menu_affix_name1.clear(true)
			popup_menu_affix_name2.clear(true)
			popup_menu_affix_name3.clear(true)
			popup_menu_affix_name4.clear(true)
			popup_menu_affix_name5.clear(true)
			for item_name in 增幅石板名称列表:
				popup_menu_item_name.add_item(item_name)
			for affix_info in 增幅石板词条列表:
				popup_menu_affix_name1.add_item(affix_info["显示名称"])
				popup_menu_affix_name2.add_item(affix_info["显示名称"])
				popup_menu_affix_name3.add_item(affix_info["显示名称"])
				popup_menu_affix_name4.add_item(affix_info["显示名称"])
				popup_menu_affix_name5.add_item(affix_info["显示名称"])
		2:
			类型选择菜单.text = "猎场核心"
			property["propertyType"] = "猎场核心"
			popup_menu_item_name.clear(true)
			popup_menu_affix_name1.clear(true)
			popup_menu_affix_name2.clear(true)
			popup_menu_affix_name3.clear(true)
			popup_menu_affix_name4.clear(true)
			popup_menu_affix_name5.clear(true)
			for item_name in 猎场核心名称列表:
				popup_menu_item_name.add_item(item_name)
			for affix_info in 猎场核心词条列表:
				popup_menu_affix_name1.add_item(affix_info["显示名称"])
				popup_menu_affix_name2.add_item(affix_info["显示名称"])
				popup_menu_affix_name3.add_item(affix_info["显示名称"])
				popup_menu_affix_name4.add_item(affix_info["显示名称"])
				popup_menu_affix_name5.add_item(affix_info["显示名称"])
		3:
			类型选择菜单.text = "深渊之眼"
			property["propertyType"] = "深渊之眼"
			popup_menu_item_name.clear(true)
			popup_menu_affix_name1.clear(true)
			popup_menu_affix_name2.clear(true)
			popup_menu_affix_name3.clear(true)
			popup_menu_affix_name4.clear(true)
			popup_menu_affix_name5.clear(true)
			for affix_name in 深渊之眼词条列表:
				popup_menu_affix_name1.add_item(affix_name)
				popup_menu_affix_name2.add_item(affix_name)
				popup_menu_affix_name3.add_item(affix_name)
				popup_menu_affix_name4.add_item(affix_name)
				popup_menu_affix_name5.add_item(affix_name)

# 稀有度选择
func _on_稀有度选择_pressed(id: int) -> void:
	match id:
		0:
			稀有度选择菜单.text = "普通"
			property["quality"] = id
			词条2.visible = false
			词条3.visible = false
			词条4.visible = false
			词条5.visible = false
		1:
			稀有度选择菜单.text = "稀有"
			property["quality"] = id
			词条2.visible = true
			词条3.visible = false
			词条4.visible = false
			词条5.visible = false
		2:
			稀有度选择菜单.text = "史诗"
			property["quality"] = id
			词条2.visible = true
			词条3.visible = true
			词条4.visible = false
			词条5.visible = false
		3:
			稀有度选择菜单.text = "传说"
			property["quality"] = id
			词条2.visible = true
			词条3.visible = true
			词条4.visible = true
			词条5.visible = false
		4:
			稀有度选择菜单.text = "混沌"
			property["quality"] = id
			词条2.visible = true
			词条3.visible = true
			词条4.visible = true
			词条5.visible = true

func _on_名称选择_pressed(id: int) -> void:
	match property["propertyType"]:
		"圣物":
			名称选择菜单.text = 圣物名称列表[id]
			property["badgeName"] = 圣物名称列表[id]
		"增幅石板":
			名称选择菜单.text = 增幅石板名称列表[id]
			property["supportSlateName"] = 增幅石板名称列表[id]
		"猎场核心":
			名称选择菜单.text = 猎场核心名称列表[id]
			property["coreName"] = 猎场核心名称列表[id]

func _on_词条1_pressed(id: int) -> void:
	match property["propertyType"]:
		"圣物":
			词条1.get_child(1).get_child(0).text = 圣物词条列表[id]["显示名称"]
			property["affixJsons"][0]["affixName"] = 圣物词条列表[id]["affixName"]
			property["affixJsons"][0]["isCompositeAffix"] = 圣物词条列表[id]["isCompositeAffix"]
			property["affixJsons"][0]["convertType"] = 圣物词条列表[id]["convertType"]
		"增幅石板":
			词条1.get_child(1).get_child(0).text = 增幅石板词条列表[id]["显示名称"]
			property["affixJsons"][0]["affixName"] = 增幅石板词条列表[id]["affixName"]
			property["affixJsons"][0]["isCompositeAffix"] = 增幅石板词条列表[id]["isCompositeAffix"]
			property["affixJsons"][0]["convertType"] = 增幅石板词条列表[id]["convertType"]
		"猎场核心":
			词条1.get_child(1).get_child(0).text = 猎场核心词条列表[id]["显示名称"]
			property["affixJsons"][0]["affixName"] = 猎场核心词条列表[id]["affixName"]
			property["affixJsons"][0]["isCompositeAffix"] = 猎场核心词条列表[id]["isCompositeAffix"]
			property["affixJsons"][0]["convertType"] = 猎场核心词条列表[id]["convertType"]
		"深渊之眼":
			词条1.get_child(1).get_child(0).text = 深渊之眼词条列表[id]
			property["powerNames"][0] = 深渊之眼词条列表[id]

func _on_词条2_pressed(id: int) -> void:
	match property["propertyType"]:
		"圣物":
			词条2.get_child(1).get_child(0).text = 圣物词条列表[id]["显示名称"]
			property["affixJsons"][1]["affixName"] = 圣物词条列表[id]["affixName"]
			property["affixJsons"][1]["isCompositeAffix"] = 圣物词条列表[id]["isCompositeAffix"]
			property["affixJsons"][1]["convertType"] = 圣物词条列表[id]["convertType"]
		"增幅石板":
			词条2.get_child(1).get_child(0).text = 增幅石板词条列表[id]["显示名称"]
			property["affixJsons"][1]["affixName"] = 增幅石板词条列表[id]["affixName"]
			property["affixJsons"][1]["isCompositeAffix"] = 增幅石板词条列表[id]["isCompositeAffix"]
			property["affixJsons"][1]["convertType"] = 增幅石板词条列表[id]["convertType"]
		"猎场核心":
			词条2.get_child(1).get_child(0).text = 猎场核心词条列表[id]["显示名称"]
			property["affixJsons"][1]["affixName"] = 猎场核心词条列表[id]["affixName"]
			property["affixJsons"][1]["isCompositeAffix"] = 猎场核心词条列表[id]["isCompositeAffix"]
			property["affixJsons"][1]["convertType"] = 猎场核心词条列表[id]["convertType"]
		"深渊之眼":
			词条2.get_child(1).get_child(0).text = 深渊之眼词条列表[id]
			property["powerNames"][1] = 深渊之眼词条列表[id]

func _on_词条3_pressed(id: int) -> void:
	match property["propertyType"]:
		"圣物":
			词条3.get_child(1).get_child(0).text = 圣物词条列表[id]["显示名称"]
			property["affixJsons"][2]["affixName"] = 圣物词条列表[id]["affixName"]
			property["affixJsons"][2]["isCompositeAffix"] = 猎场核心词条列表[id]["isCompositeAffix"]
			property["affixJsons"][2]["convertType"] = 猎场核心词条列表[id]["convertType"]
		"增幅石板":
			词条3.get_child(1).get_child(0).text = 增幅石板词条列表[id]["显示名称"]
			property["affixJsons"][2]["affixName"] = 增幅石板词条列表[id]["affixName"]
			property["affixJsons"][2]["isCompositeAffix"] = 增幅石板词条列表[id]["isCompositeAffix"]
			property["affixJsons"][2]["convertType"] = 增幅石板词条列表[id]["convertType"]
		"猎场核心":
			词条3.get_child(1).get_child(0).text = 猎场核心词条列表[id]["显示名称"]
			property["affixJsons"][2]["affixName"] = 猎场核心词条列表[id]["affixName"]
			property["affixJsons"][2]["isCompositeAffix"] = 猎场核心词条列表[id]["isCompositeAffix"]
			property["affixJsons"][2]["convertType"] = 猎场核心词条列表[id]["convertType"]
		"深渊之眼":
			词条3.get_child(1).get_child(0).text = 深渊之眼词条列表[id]
			property["powerNames"][2] = 深渊之眼词条列表[id]

func _on_词条4_pressed(id: int) -> void:
	match property["propertyType"]:
		"圣物":
			词条4.get_child(1).get_child(0).text = 圣物词条列表[id]["显示名称"]
			property["affixJsons"][3]["affixName"] = 圣物词条列表[id]["affixName"]
			property["affixJsons"][3]["isCompositeAffix"] = 圣物词条列表[id]["isCompositeAffix"]
			property["affixJsons"][3]["convertType"] = 圣物词条列表[id]["convertType"]
		"增幅石板":
			词条4.get_child(1).get_child(0).text = 增幅石板词条列表[id]["显示名称"]
			property["affixJsons"][3]["affixName"] = 增幅石板词条列表[id]["affixName"]
			property["affixJsons"][3]["isCompositeAffix"] = 增幅石板词条列表[id]["isCompositeAffix"]
			property["affixJsons"][3]["convertType"] = 增幅石板词条列表[id]["convertType"]
		"猎场核心":
			词条4.get_child(1).get_child(0).text = 猎场核心词条列表[id]["显示名称"]
			property["affixJsons"][3]["affixName"] = 猎场核心词条列表[id]["affixName"]
			property["affixJsons"][3]["isCompositeAffix"] = 猎场核心词条列表[id]["isCompositeAffix"]
			property["affixJsons"][3]["convertType"] = 猎场核心词条列表[id]["convertType"]
		"深渊之眼":
			词条4.get_child(1).get_child(0).text = 深渊之眼词条列表[id]
			property["powerNames"][3] = 深渊之眼词条列表[id]

func _on_词条5_pressed(id: int) -> void:
	match property["propertyType"]:
		"圣物":
			词条5.get_child(1).get_child(0).text = 圣物词条列表[id]["显示名称"]
			property["affixJsons"][4]["affixName"] = 圣物词条列表[id]["affixName"]
			property["affixJsons"][4]["isCompositeAffix"] = 圣物词条列表[id]["isCompositeAffix"]
			property["affixJsons"][4]["convertType"] = 圣物词条列表[id]["convertType"]
		"增幅石板":
			词条5.get_child(1).get_child(0).text = 增幅石板词条列表[id]["显示名称"]
			property["affixJsons"][4]["affixName"] = 增幅石板词条列表[id]["affixName"]
			property["affixJsons"][4]["isCompositeAffix"] = 增幅石板词条列表[id]["isCompositeAffix"]
			property["affixJsons"][4]["convertType"] = 增幅石板词条列表[id]["convertType"]
		"猎场核心":
			词条5.get_child(1).get_child(0).text = 猎场核心词条列表[id]["显示名称"]
			property["affixJsons"][4]["affixName"] = 猎场核心词条列表[id]["affixName"]
			property["affixJsons"][4]["isCompositeAffix"] = 猎场核心词条列表[id]["isCompositeAffix"]
			property["affixJsons"][4]["convertType"] = 猎场核心词条列表[id]["convertType"]
		"深渊之眼":
			词条5.get_child(1).get_child(0).text = 深渊之眼词条列表[id]
			property["powerNames"][4] = 深渊之眼词条列表[id]

func _on_词条1稀有度_pressed(id: int) -> void:
	var menu_button: MenuButton = 词条1.get_child(1).get_child(1)
	match id:
		0:
			menu_button.text = "普通"
			property["affixJsons"][0]["quality"] = id
		1:
			menu_button.text = "稀有"
			property["affixJsons"][0]["quality"] = id
		2:
			menu_button.text = "史诗"
			property["affixJsons"][0]["quality"] = id
		3:
			menu_button.text = "传说"
			property["affixJsons"][0]["quality"] = id
		4:
			menu_button.text = "混沌"
			property["affixJsons"][0]["quality"] = id

func _on_词条2稀有度_pressed(id: int) -> void:
	var menu_button: MenuButton = 词条2.get_child(1).get_child(1)
	match id:
		0:
			menu_button.text = "普通"
			property["affixJsons"][1]["quality"] = id
		1:
			menu_button.text = "稀有"
			property["affixJsons"][1]["quality"] = id
		2:
			menu_button.text = "史诗"
			property["affixJsons"][1]["quality"] = id
		3:
			menu_button.text = "传说"
			property["affixJsons"][1]["quality"] = id
		4:
			menu_button.text = "混沌"
			property["affixJsons"][1]["quality"] = id

func _on_词条3稀有度_pressed(id: int) -> void:
	var menu_button: MenuButton = 词条3.get_child(1).get_child(1)
	match id:
		0:
			menu_button.text = "普通"
			property["affixJsons"][2]["quality"] = id
		1:
			menu_button.text = "稀有"
			property["affixJsons"][2]["quality"] = id
		2:
			menu_button.text = "史诗"
			property["affixJsons"][2]["quality"] = id
		3:
			menu_button.text = "传说"
			property["affixJsons"][2]["quality"] = id
		4:
			menu_button.text = "混沌"
			property["affixJsons"][2]["quality"] = id

func _on_词条4稀有度_pressed(id: int) -> void:
	var menu_button: MenuButton = 词条4.get_child(1).get_child(1)
	match id:
		0:
			menu_button.text = "普通"
			property["affixJsons"][3]["quality"] = id
		1:
			menu_button.text = "稀有"
			property["affixJsons"][3]["quality"] = id
		2:
			menu_button.text = "史诗"
			property["affixJsons"][3]["quality"] = id
		3:
			menu_button.text = "传说"
			property["affixJsons"][3]["quality"] = id
		4:
			menu_button.text = "混沌"
			property["affixJsons"][3]["quality"] = id

func _on_词条5稀有度_pressed(id: int) -> void:
	var menu_button: MenuButton = 词条5.get_child(1).get_child(1)
	match id:
		0:
			menu_button.text = "普通"
			property["affixJsons"][4]["quality"] = id
		1:
			menu_button.text = "稀有"
			property["affixJsons"][4]["quality"] = id
		2:
			menu_button.text = "史诗"
			property["affixJsons"][4]["quality"] = id
		3:
			menu_button.text = "传说"
			property["affixJsons"][4]["quality"] = id
		4:
			menu_button.text = "混沌"
			property["affixJsons"][4]["quality"] = id

func _on_词条1混沌化_pressed() -> void:
	property["affixJsons"][0]["deeplyChaosed"] = !property["affixJsons"][0]["deeplyChaosed"]

func _on_词条2混沌化_pressed() -> void:
	property["affixJsons"][1]["deeplyChaosed"] = !property["affixJsons"][1]["deeplyChaosed"]

func _on_词条3混沌化_pressed() -> void:
	property["affixJsons"][2]["deeplyChaosed"] = !property["affixJsons"][2]["deeplyChaosed"]

func _on_词条4混沌化_pressed() -> void:
	property["affixJsons"][3]["deeplyChaosed"] = !property["affixJsons"][3]["deeplyChaosed"]

func _on_词条5混沌化_pressed() -> void:
	property["affixJsons"][4]["deeplyChaosed"] = !property["affixJsons"][4]["deeplyChaosed"]

func _on_生成_pressed() -> void:
	var sharer: String = $VBoxContainer/分享人/TextEdit.text
	var shareWords: String = $VBoxContainer/寄语/TextEdit.text
	match property["propertyType"]:
		"圣物":
			var data: Dictionary = {
				"propertyType":"圣物",
				"sp":15,
				"recoverSpTimes":0,
				"tryQualityUpTimes":0,
				"chaosTimes":0,
				"isBroken":false,
				"isLocked":false,
				"pickUpTime":0,
				"symbolCode":0,
				"sharer":sharer,
				"shareWords":shareWords,
				"chaosAffixIdx":0,
				"saveJson":"{\"sp\":15,\"recoverSpTimes\":0,\"tryQualityUpTimes\":0,\"chaosTimes\":0,\"quality\":4,\"isBroken\":false,\"isLocked\":false,\"pickUpTime\":89654.5625,\"symbolCode\":-1635367200,\"sharer\":\"\",\"shareWords\":\"\",\"chaosAffixIdx\":0,\"affixJsons\":[\"{\\\"affixName\\\":\\\"全部防御\\\",\\\"isCompositeAffix\\\":true,\\\"quality\\\":4,\\\"convertType\\\":0,\\\"num\\\":0.14000000059604646,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"火焰伤害\\\",\\\"isCompositeAffix\\\":false,\\\"quality\\\":0,\\\"convertType\\\":1,\\\"num\\\":0.05999999865889549,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"召唤物全部防御\\\",\\\"isCompositeAffix\\\":true,\\\"quality\\\":0,\\\"convertType\\\":0,\\\"num\\\":0.07000000029802323,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"闪避率\\\",\\\"isCompositeAffix\\\":false,\\\"quality\\\":2,\\\"convertType\\\":0,\\\"num\\\":0.05999999865889549,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"闪电伤害\\\",\\\"isCompositeAffix\\\":false,\\\"quality\\\":0,\\\"convertType\\\":1,\\\"num\\\":0.05000000074505806,\\\"deeplyChaosed\\\":false}\"],\"badgeName\":\"聚能棱晶\",\"onBodyIdx\":-1}"
				}
			var saveJson: Dictionary = {
				"sp":15,
				"recoverSpTimes":0,
				"tryQualityUpTimes":0,
				"chaosTimes":0,
				"quality":property["quality"],
				"isBroken":false,
				"isLocked":false,
				"pickUpTime":0,
				"symbolCode":0,
				"sharer":sharer,
				"shareWords":shareWords,
				"chaosAffixIdx":0,
				"affixJsons":[
					"{\"affixName\":\"全部防御\",\"isCompositeAffix\":true,\"quality\":4,\"convertType\":0,\"num\":0.14000000059604646,\"deeplyChaosed\":false}",
					"{\"affixName\":\"火焰伤害\",\"isCompositeAffix\":false,\"quality\":0,\"convertType\":1,\"num\":0.05999999865889549,\"deeplyChaosed\":false}",
					"{\"affixName\":\"召唤物全部防御\",\"isCompositeAffix\":true,\"quality\":0,\"convertType\":0,\"num\":0.07000000029802323,\"deeplyChaosed\":false}",
					"{\"affixName\":\"闪避率\",\"isCompositeAffix\":false,\"quality\":2,\"convertType\":0,\"num\":0.05999999865889549,\"deeplyChaosed\":false}",
					"{\"affixName\":\"闪电伤害\",\"isCompositeAffix\":false,\"quality\":0,\"convertType\":1,\"num\":0.05000000074505806,\"deeplyChaosed\":false}"],
				"badgeName":property["badgeName"],
				"onBodyIdx":-1
				}
			var affixJsons: Array[Dictionary] = [
				{"affixName":"全部防御","isCompositeAffix":true,"quality":4,"convertType":0,"num":0.14000000059604646,"deeplyChaosed":false},
				{"affixName":"火焰伤害","isCompositeAffix":false,"quality":0,"convertType":1,"num":0.05999999865889549,"deeplyChaosed":false},
				{"affixName":"召唤物全部防御","isCompositeAffix":true,"quality":0,"convertType":0,"num":0.07000000029802323,"deeplyChaosed":false},
				{"affixName":"闪避率","isCompositeAffix":false,"quality":2,"convertType":0,"num":0.05999999865889549,"deeplyChaosed":false},
				{"affixName":"闪电伤害","isCompositeAffix":false,"quality":0,"convertType":1,"num":0.05000000074505806,"deeplyChaosed":false},
				]
			if property["quality"] >= 0:
				affixJsons[0] = property["affixJsons"][0]
			if property["quality"] >= 1:
				affixJsons[1] = property["affixJsons"][1]
			if property["quality"] >= 2:
				affixJsons[2] = property["affixJsons"][2]
			if property["quality"] >= 3:
				affixJsons[3] = property["affixJsons"][3]
			if property["quality"] >= 4:
				affixJsons[4] = property["affixJsons"][4]
			affixJsons[0]["num"] = float(词条1.get_child(1).get_child(3).text)
			affixJsons[1]["num"] = float(词条2.get_child(1).get_child(3).text)
			affixJsons[2]["num"] = float(词条3.get_child(1).get_child(3).text)
			affixJsons[3]["num"] = float(词条4.get_child(1).get_child(3).text)
			affixJsons[4]["num"] = float(词条5.get_child(1).get_child(3).text)
			if property["quality"] < 4:
				affixJsons.pop_back()
			if property["quality"] < 3:
				affixJsons.pop_back()
			if property["quality"] < 2:
				affixJsons.pop_back()
			if property["quality"] < 1:
				affixJsons.pop_back()
			var affixJsonsStings: Array[String] = []
			for affixJson in affixJsons:
				affixJsonsStings.append(JSON.stringify(affixJson))
			saveJson["affixJsons"] = affixJsonsStings
			if affixJsons[0]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 1
			elif property["quality"] >= 1 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 2
			elif property["quality"] >= 2 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 3
			elif property["quality"] >= 3 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 4
			elif property["quality"] >= 4 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 5
			data["saveJson"] = JSON.stringify(saveJson, "", false)
			data["chaosTimes"] = saveJson["chaosTimes"]
			data["chaosAffixIdx"] = saveJson["chaosAffixIdx"]
			代码.text = compress(JSON.stringify(data, "", false))
		"增幅石板":
			var data: Dictionary = {
				"propertyType":"增幅石板",
				"sp":15,
				"recoverSpTimes":0,
				"tryQualityUpTimes":0,
				"chaosTimes":0,
				"isBroken":false,
				"isLocked":false,
				"pickUpTime":0,
				"symbolCode":0,
				"sharer":sharer,
				"shareWords":shareWords,
				"chaosAffixIdx":0,
				"saveJson":"{\"sp\":15,\"recoverSpTimes\":0,\"tryQualityUpTimes\":0,\"chaosTimes\":0,\"quality\":4,\"isBroken\":false,\"isLocked\":false,\"pickUpTime\":89654.5625,\"symbolCode\":-1635367200,\"sharer\":\"\",\"shareWords\":\"\",\"chaosAffixIdx\":0,\"affixJsons\":[\"{\\\"affixName\\\":\\\"全部防御\\\",\\\"isCompositeAffix\\\":true,\\\"quality\\\":4,\\\"convertType\\\":0,\\\"num\\\":0.14000000059604646,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"火焰伤害\\\",\\\"isCompositeAffix\\\":false,\\\"quality\\\":0,\\\"convertType\\\":1,\\\"num\\\":0.05999999865889549,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"召唤物全部防御\\\",\\\"isCompositeAffix\\\":true,\\\"quality\\\":0,\\\"convertType\\\":0,\\\"num\\\":0.07000000029802323,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"闪避率\\\",\\\"isCompositeAffix\\\":false,\\\"quality\\\":2,\\\"convertType\\\":0,\\\"num\\\":0.05999999865889549,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"闪电伤害\\\",\\\"isCompositeAffix\\\":false,\\\"quality\\\":0,\\\"convertType\\\":1,\\\"num\\\":0.05000000074505806,\\\"deeplyChaosed\\\":false}\"],\"badgeName\":\"聚能棱晶\",\"onBodyIdx\":-1}"
				}
			var saveJson: Dictionary = {
				"sp":15,
				"recoverSpTimes":0,
				"tryQualityUpTimes":0,
				"chaosTimes":0,
				"quality":property["quality"],
				"isBroken":false,
				"isLocked":false,
				"pickUpTime":0,
				"symbolCode":0,
				"sharer":sharer,
				"shareWords":shareWords,
				"chaosAffixIdx":0,
				"affixJsons":[
					"{\"affixName\":\"全部防御\",\"isCompositeAffix\":true,\"quality\":4,\"convertType\":0,\"num\":0.14000000059604646,\"deeplyChaosed\":false}",
					"{\"affixName\":\"火焰伤害\",\"isCompositeAffix\":false,\"quality\":0,\"convertType\":1,\"num\":0.05999999865889549,\"deeplyChaosed\":false}",
					"{\"affixName\":\"召唤物全部防御\",\"isCompositeAffix\":true,\"quality\":0,\"convertType\":0,\"num\":0.07000000029802323,\"deeplyChaosed\":false}",
					"{\"affixName\":\"闪避率\",\"isCompositeAffix\":false,\"quality\":2,\"convertType\":0,\"num\":0.05999999865889549,\"deeplyChaosed\":false}",
					"{\"affixName\":\"闪电伤害\",\"isCompositeAffix\":false,\"quality\":0,\"convertType\":1,\"num\":0.05000000074505806,\"deeplyChaosed\":false}"],
				"supportSlateName":property["supportSlateName"],
				"slateIdx":-1,
				"onSlatePositionIdx":-1
				}
			var affixJsons: Array[Dictionary] = [
				{"affixName":"全部防御","isCompositeAffix":true,"quality":4,"convertType":0,"num":0.14000000059604646,"deeplyChaosed":false},
				{"affixName":"火焰伤害","isCompositeAffix":false,"quality":0,"convertType":1,"num":0.05999999865889549,"deeplyChaosed":false},
				{"affixName":"召唤物全部防御","isCompositeAffix":true,"quality":0,"convertType":0,"num":0.07000000029802323,"deeplyChaosed":false},
				{"affixName":"闪避率","isCompositeAffix":false,"quality":2,"convertType":0,"num":0.05999999865889549,"deeplyChaosed":false},
				{"affixName":"闪电伤害","isCompositeAffix":false,"quality":0,"convertType":1,"num":0.05000000074505806,"deeplyChaosed":false},
				]
			if property["quality"] >= 0:
				affixJsons[0] = property["affixJsons"][0]
			if property["quality"] >= 1:
				affixJsons[1] = property["affixJsons"][1]
			if property["quality"] >= 2:
				affixJsons[2] = property["affixJsons"][2]
			if property["quality"] >= 3:
				affixJsons[3] = property["affixJsons"][3]
			if property["quality"] >= 4:
				affixJsons[4] = property["affixJsons"][4]
			affixJsons[0]["num"] = float(词条1.get_child(1).get_child(3).text)
			affixJsons[1]["num"] = float(词条2.get_child(1).get_child(3).text)
			affixJsons[2]["num"] = float(词条3.get_child(1).get_child(3).text)
			affixJsons[3]["num"] = float(词条4.get_child(1).get_child(3).text)
			affixJsons[4]["num"] = float(词条5.get_child(1).get_child(3).text)
			if property["quality"] < 4:
				affixJsons.pop_back()
			if property["quality"] < 3:
				affixJsons.pop_back()
			if property["quality"] < 2:
				affixJsons.pop_back()
			if property["quality"] < 1:
				affixJsons.pop_back()
			var affixJsonsStings: Array[String] = []
			for affixJson in affixJsons:
				affixJsonsStings.append(JSON.stringify(affixJson))
			saveJson["affixJsons"] = affixJsonsStings
			if affixJsons[0]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 1
			elif property["quality"] >= 1 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 2
			elif property["quality"] >= 2 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 3
			elif property["quality"] >= 3 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 4
			elif property["quality"] >= 4 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 5
			data["saveJson"] = JSON.stringify(saveJson, "", false)
			data["chaosTimes"] = saveJson["chaosTimes"]
			data["chaosAffixIdx"] = saveJson["chaosAffixIdx"]
			代码.text = compress(JSON.stringify(data, "", false))
		"猎场核心":
			var data: Dictionary = {
				"propertyType":"猎场核心",
				"sp":15,
				"recoverSpTimes":0,
				"tryQualityUpTimes":0,
				"chaosTimes":0,
				"isBroken":false,
				"isLocked":false,
				"pickUpTime":0,
				"symbolCode":0,
				"sharer":sharer,
				"shareWords":shareWords,
				"chaosAffixIdx":0,
				"saveJson":"{\"sp\":15,\"recoverSpTimes\":0,\"tryQualityUpTimes\":0,\"chaosTimes\":0,\"quality\":4,\"isBroken\":false,\"isLocked\":false,\"pickUpTime\":89654.5625,\"symbolCode\":-1635367200,\"sharer\":\"\",\"shareWords\":\"\",\"chaosAffixIdx\":0,\"affixJsons\":[\"{\\\"affixName\\\":\\\"全部防御\\\",\\\"isCompositeAffix\\\":true,\\\"quality\\\":4,\\\"convertType\\\":0,\\\"num\\\":0.14000000059604646,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"火焰伤害\\\",\\\"isCompositeAffix\\\":false,\\\"quality\\\":0,\\\"convertType\\\":1,\\\"num\\\":0.05999999865889549,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"召唤物全部防御\\\",\\\"isCompositeAffix\\\":true,\\\"quality\\\":0,\\\"convertType\\\":0,\\\"num\\\":0.07000000029802323,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"闪避率\\\",\\\"isCompositeAffix\\\":false,\\\"quality\\\":2,\\\"convertType\\\":0,\\\"num\\\":0.05999999865889549,\\\"deeplyChaosed\\\":false}\",\"{\\\"affixName\\\":\\\"闪电伤害\\\",\\\"isCompositeAffix\\\":false,\\\"quality\\\":0,\\\"convertType\\\":1,\\\"num\\\":0.05000000074505806,\\\"deeplyChaosed\\\":false}\"],\"badgeName\":\"聚能棱晶\",\"onBodyIdx\":-1}"
				}
			var saveJson: Dictionary = {
				"sp":15,
				"recoverSpTimes":0,
				"tryQualityUpTimes":0,
				"chaosTimes":0,
				"quality":property["quality"],
				"isBroken":false,
				"isLocked":false,
				"pickUpTime":0,
				"symbolCode":0,
				"sharer":sharer,
				"shareWords":shareWords,
				"chaosAffixIdx":0,
				"affixJsons":[
					"{\"affixName\":\"全部防御\",\"isCompositeAffix\":true,\"quality\":4,\"convertType\":0,\"num\":0.14000000059604646,\"deeplyChaosed\":false}",
					"{\"affixName\":\"火焰伤害\",\"isCompositeAffix\":false,\"quality\":0,\"convertType\":1,\"num\":0.05999999865889549,\"deeplyChaosed\":false}",
					"{\"affixName\":\"召唤物全部防御\",\"isCompositeAffix\":true,\"quality\":0,\"convertType\":0,\"num\":0.07000000029802323,\"deeplyChaosed\":false}",
					"{\"affixName\":\"闪避率\",\"isCompositeAffix\":false,\"quality\":2,\"convertType\":0,\"num\":0.05999999865889549,\"deeplyChaosed\":false}",
					"{\"affixName\":\"闪电伤害\",\"isCompositeAffix\":false,\"quality\":0,\"convertType\":1,\"num\":0.05000000074505806,\"deeplyChaosed\":false}"],
				"coreName":property["coreName"],
				"onBodyIdx":-1
				}
			var affixJsons: Array[Dictionary] = [
				{"affixName":"全部防御","isCompositeAffix":true,"quality":4,"convertType":0,"num":0.14000000059604646,"deeplyChaosed":false},
				{"affixName":"火焰伤害","isCompositeAffix":false,"quality":0,"convertType":1,"num":0.05999999865889549,"deeplyChaosed":false},
				{"affixName":"召唤物全部防御","isCompositeAffix":true,"quality":0,"convertType":0,"num":0.07000000029802323,"deeplyChaosed":false},
				{"affixName":"闪避率","isCompositeAffix":false,"quality":2,"convertType":0,"num":0.05999999865889549,"deeplyChaosed":false},
				{"affixName":"闪电伤害","isCompositeAffix":false,"quality":0,"convertType":1,"num":0.05000000074505806,"deeplyChaosed":false},
				]
			if property["quality"] >= 0:
				affixJsons[0] = property["affixJsons"][0]
			if property["quality"] >= 1:
				affixJsons[1] = property["affixJsons"][1]
			if property["quality"] >= 2:
				affixJsons[2] = property["affixJsons"][2]
			if property["quality"] >= 3:
				affixJsons[3] = property["affixJsons"][3]
			if property["quality"] >= 4:
				affixJsons[4] = property["affixJsons"][4]
			affixJsons[0]["num"] = float(词条1.get_child(1).get_child(3).text)
			affixJsons[1]["num"] = float(词条2.get_child(1).get_child(3).text)
			affixJsons[2]["num"] = float(词条3.get_child(1).get_child(3).text)
			affixJsons[3]["num"] = float(词条4.get_child(1).get_child(3).text)
			affixJsons[4]["num"] = float(词条5.get_child(1).get_child(3).text)
			if property["quality"] < 4:
				affixJsons.pop_back()
			if property["quality"] < 3:
				affixJsons.pop_back()
			if property["quality"] < 2:
				affixJsons.pop_back()
			if property["quality"] < 1:
				affixJsons.pop_back()
			var affixJsonsStings: Array[String] = []
			for affixJson in affixJsons:
				affixJsonsStings.append(JSON.stringify(affixJson))
			saveJson["affixJsons"] = affixJsonsStings
			if affixJsons[0]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 1
			elif property["quality"] >= 1 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 2
			elif property["quality"] >= 2 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 3
			elif property["quality"] >= 3 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 4
			elif property["quality"] >= 4 and affixJsons[1]["deeplyChaosed"]:
				saveJson["chaosTimes"] = 1
				saveJson["chaosAffixIdx"] = 5
			data["saveJson"] = JSON.stringify(saveJson, "", false)
			data["chaosTimes"] = saveJson["chaosTimes"]
			data["chaosAffixIdx"] = saveJson["chaosAffixIdx"]
			代码.text = compress(JSON.stringify(data, "", false))
		"深渊之眼":
			var data: Dictionary = {
				"propertyType":"深渊之眼",
				"sp":15,
				"recoverSpTimes":0,
				"tryQualityUpTimes":0,
				"chaosTimes":0,
				"isBroken":false,
				"isLocked":false,
				"pickUpTime":0,
				"symbolCode":0,
				"sharer":sharer,
				"shareWords":shareWords,
				"chaosAffixIdx":0,
				"saveJson":"{\"sp\":15,\"recoverSpTimes\":0,\"tryQualityUpTimes\":0,\"chaosTimes\":0,\"quality\":4,\"isBroken\":false,\"isLocked\":false,\"pickUpTime\":73124.0,\"symbolCode\":-26579908,\"sharer\":\"\",\"shareWords\":\"\",\"chaosAffixIdx\":0,\"affixJsons\":[],\"powerNames\":[\"发条人\",\"萨满\",\"毒素大师\",\"灵巧猎手\",\"智者\"],\"powers\":[1,1,1,1,1],\"onBodyIdx\":-1}"
			}
			var saveJson: Dictionary = {
				"sp":15,
				"recoverSpTimes":0,
				"tryQualityUpTimes":0,
				"chaosTimes":0,
				"quality":property["quality"],
				"isBroken":false,
				"isLocked":false,
				"pickUpTime":0,
				"symbolCode":0,
				"sharer":sharer,
				"shareWords":shareWords,
				"chaosAffixIdx":0,
				"affixJsons":[],
				"powerNames":["发条人","萨满","毒素大师","灵巧猎手","智者"],
				"powers":[1,1,1,1,1],
				"onBodyIdx":-1}
			var powerNames: Array[String] = []
			for i in range(property["quality"]+1):
				powerNames.append(property["powerNames"][i])
			saveJson["powerNames"] = powerNames
			data["saveJson"] = JSON.stringify(saveJson,"",false)
			代码.text = compress(JSON.stringify(data, "", false))

func compress(data: String) -> String:
	var bytes: PackedByteArray = data.to_utf8_buffer()
	var compressed: PackedByteArray = bytes.compress(1)
	return Marshalls.raw_to_base64(compressed.slice(2, compressed.size() - 4))

func _on_复制_pressed() -> void:
	var code = 代码.text
	DisplayServer.clipboard_set(code)
