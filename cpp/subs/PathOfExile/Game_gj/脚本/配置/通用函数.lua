
定义函数 通用_处理登陆场景()
    自动登陆帐号()
结束

定义函数 通用_处理选择角色场景()
    --如果你想指定角色名，则把下面的注释取消掉
    --选择进入游戏("角色名")
    自动创建选择角色()
结束

通用_登陆场景 = 登陆场景(通用_处理登陆场景)
通用_选择角色场景 = 选择角色场景(通用_处理选择角色场景)
---------------【以下为装备属性评分设置】-------------------------------
---------------【装备属性评分】
---------------【请确保 定义属性唯一性，否则评分增加】
定义函数 通用_装备属性评分(属性信息)
    局部变量 总分值 = 0
    局部变量 临时数值, 数值
    临时数值 = 属性信息["法术附加闪电伤害"]
    如果 临时数值 那么
        --如果出现双属性的评分方式
        数值 = math.modf(法术附加闪电伤害[1]/3)	--第一个数值
		--局部变量 数值2 = math.modf(法术附加闪电伤害[2]/5) --第二个数值 
        总分值 = 总分值 + 数值
    结束
    临时数值 =  属性信息["全抗性"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]/5)
        总分值 = 总分值 + 数值
    结束
    临时数值 = 属性信息["能量护盾"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]/10)
        总分值 = 总分值 + 数值
    结束
	临时数值 = 属性信息["护盾百分比"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]/10)
        总分值 = 总分值 + 数值
    结束
    临时数值 = 属性信息["生命"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]/10)
        总分值 = 总分值 + 数值
    结束
    临时数值 = 属性信息["施法速度"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]/2)
        总分值 = 总分值 + 数值
    结束
	临时数值 = 属性信息["移动速度"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]/3)
        总分值 = 总分值 + 数值
    结束
	临时数值 = 属性信息["火焰抗性"]
    如果 临时数值 ~= 空 那么
        数值 = math.modf(临时数值[1]/5)
        总分值 = 总分值 + 数值
    结束
	临时数值 = 属性信息["闪电抗性"]
	如果 临时数值 ~= 空 那么
        数值 = math.modf(临时数值[1]/5)
        总分值 = 总分值 + 数值
    结束
	临时数值 = 属性信息["冰霜抗性"]
	如果 临时数值 ~= 空 那么
        数值 = math.modf(临时数值[1]/5)
        总分值 = 总分值 + 数值
    结束
	临时数值 = 属性信息["攻击和法术暴击率"]
    如果 临时数值 ~= 空 那么
        数值 = math.modf(临时数值[1]/8)
        总分值 = 总分值 + 数值
    结束
    返回 总分值
结束
------------------【武器属性评分】
定义函数 通用_武器属性评分(属性信息)
    局部变量 总分值 = 0
    局部变量 临时数值, 数值
    临时数值 = 属性信息["施法速度"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]/2)
        总分值 = 总分值 + 数值
    结束
    临时数值 = 属性信息["增加火焰伤害"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]/5)
        总分值 = 总分值 + 数值
    结束
	临时数值 = 属性信息["宝石等级"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]*20)
        总分值 = 总分值 + 数值
    结束
	临时数值 = 属性信息["火焰宝石等级"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]*20)
        总分值 = 总分值 + 数值
    结束
    临时数值 = 属性信息["攻击和法术暴击率"]
    如果 临时数值 那么
        数值 = math.modf(临时数值[1]/8)
        总分值 = 总分值 + 数值
    结束
    返回 总分值
结束
------------------【物品属性评分函数定义】
定义函数 通用_物品属性评分(属性表)
    局部变量 属性数量 = 0
    如果 type(属性表) ~= "table" then
        LogE("物品属性评分错误")
		返回 0
    结束
    局部变量 装备类型 = 属性表["物品类型"]
    如果 装备类型 == 空 那么
        LogE("物品属性评分错误")
        返回 0
    结束
    局部变量 属性信息 = 属性表["属性信息"]
    如果 属性信息 == 空 那么
        LogE("物品属性评分该物品属性信息为空 ")
        返回 0
    结束
    如果 装备类型 == 物品类型.项链 或 装备类型 == 物品类型.戒指 或 装备类型 == 物品类型.手套 或 装备类型 == 物品类型.胸甲 或 装备类型 == 物品类型.盾 或 装备类型 == 物品类型.鞋子 或 装备类型 == 物品类型.头部 或 装备类型 == 物品类型.腰带 那么
		返回 通用_装备属性评分(属性信息)
    否则如果  装备类型 == 物品类型.长杖 或 装备类型 == 物品类型.匕首 或 装备类型 == 物品类型.法杖 或 装备类型 == 物品类型.短杖 那么
        返回 通用_武器属性评分(属性信息)
    否则
        返回  0
    结束
结束
------------------【以上为装备属性评分设置】
------------------【以下为存仓属性过滤设置】
------------------【衣服和盾存仓属性过滤】
定义函数 通用_衣服存仓属性过滤(属性表,满足条数,数值满足条数)
    局部变量  属性数量 = 0
    局部变量  满足数值 = 0
    局部变量  临时数值, 属性值
    临时数值 = 属性表["生命"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 100 那么
            满足数值 = 满足数值 + 1
        结束
    结束
    临时数值 = 属性表["火焰抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["闪电抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["全抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
   临时数值 = 属性表["生命百分比"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 10 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["能量护盾"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 50 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["护盾百分比"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    如果 属性数量 >= 满足条数 或 满足数值 >= 数值满足条数 那么
        返回 真
    结束
    返回 假
结束
------------------【鞋子存仓属性过滤】
定义函数 通用_鞋子存仓属性过滤(属性表,满足条数,数值满足条数)
    局部变量  属性数量 = 0
    局部变量  满足数值 = 0
    局部变量  临时数值, 属性值
    临时数值 = 属性表["生命"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 100 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
   临时数值 = 属性表["火焰抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["闪电抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["全抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["冰霜抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["生命百分比"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 10 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["能量护盾"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 50 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["护盾百分比"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["物品稀有度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["移动速度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 30 那么
            满足数值 = 满足数值 + 1
            返回 真
        结束
    结束
    如果 属性数量 >= 满足条数 或 满足数值 >= 数值满足条数 那么
        返回 真
    结束
    返回 假
结束
------------------【头部存仓属性过滤】
定义函数 通用_头部存仓属性过滤(属性表,满足条数,数值满足条数)
    局部变量  属性数量 = 0
    局部变量  满足数值 = 0
    局部变量  临时数值, 属性值
    临时数值 = 属性表["生命"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 100 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
   临时数值 = 属性表["火焰抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["闪电抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
   临时数值 = 属性表["全抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["冰霜抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
   临时数值 = 属性表["能量护盾"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 50 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["护盾百分比"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["物品稀有度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["攻击速度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["施法速度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["命中"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    如果 属性数量 >= 满足条数 或 满足数值 >= 数值满足条数 那么
        返回 真
    结束
    返回 假
结束
------------------【手套存仓属性过滤】
定义函数 通用_手套存仓属性过滤(属性表,满足条数,数值满足条数)
    局部变量  属性数量 = 0
    局部变量  满足数值 = 0
    局部变量  临时数值, 属性值
    临时数值 =  属性表["生命"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 100 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["火焰抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["闪电抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["全抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["冰霜抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["能量护盾"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 50 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["护盾百分比"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["物品稀有度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["攻击速度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["施法速度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["命中"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["投射物速度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 10 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["投射物伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 14 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["增加法术伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 10 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    如果 属性数量 >= 满足条数 或 满足数值 >= 数值满足条数 那么
        返回 真
    结束
    返回 假
结束
----------------------------------------------------------------------------
------------------【项链和戒指存仓属性过滤】
定义函数 通用_项链和戒指存仓属性过滤(属性表,满足条数,数值满足条数)
    局部变量  属性数量 = 0
    局部变量  满足数值 = 0
    局部变量  临时数值, 属性值
    局临时数值 = 属性表["生命"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 100 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["物品掉落数量"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["火焰抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["闪电抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["全抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["冰霜抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["护盾百分比"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["物品稀有度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["攻击速度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["施法速度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["命中"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["增加法术伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 10 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["闪电技能暴击率"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 12 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["全元素暴击率"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["物理伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["附加物理伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 20 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["武器攻击增加元素伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 20 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["全能力"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["力量"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 40 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["敏捷"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 40 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["智慧"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 40 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["全元素暴击率"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 25 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["法术暴击率"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 25 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["法术暴击率"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 25 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["火焰技能暴击伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["冰霜技能暴击伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["闪电技能暴击伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["增加火焰伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 10 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["增加冰霜伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 10 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["增加闪电伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 10 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["法术附加火焰伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 20 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["法术附加冰霜伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 20 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["法术附加闪电伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 20 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    如果 属性数量 >= 满足条数 或 满足数值 >= 数值满足条数 那么
        返回 真
    结束
    返回 假
结束
------------------【武器存仓属性过滤】
定义函数 通用_武器存仓属性过滤(属性表,满足条数,数值满足条数)
    局部变量 属性数量 = 0
    局部变量 满足数值 = 0
    局部变量  临时数值, 属性值
    临时数值 =  属性表["生命"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 100 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["物品掉落数量"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["火焰抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["闪电抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["全抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    如果 属性数量 >= 满足条数 或 满足数值 >= 数值满足条数 那么
        返回 真
    结束
    返回 假
结束	
------------------【腰带存仓属性过滤】
定义函数 通用_腰带存仓属性过滤(属性表,满足条数,数值满足条数)
    局部变量 属性数量 = 0
    局部变量 满足数值 = 0
    局部变量  临时数值, 属性值
    临时数值 = 属性表["生命"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 100 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["火焰抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["闪电抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["全抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["冰霜抗性"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 15 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    临时数值 = 属性表["护盾百分比"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["物品稀有度"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["增加药剂作用"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 10 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["武器攻击增加元素伤害"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 20 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
	临时数值 = 属性表["物品掉落数量"]
    如果 临时数值 那么
        属性数量 = 属性数量 + 1
        属性值 = 临时数值[1]
        如果 属性值 >= 5 那么
            满足数值 = 满足数值 + 1
            --返回 真
        结束
    结束
    如果 属性数量 >= 满足条数 或 满足数值 >= 数值满足条数 那么
        返回 真
    结束
    返回 假
结束
--------------------------------【阅读注释】----------------------------------
----------------------------------------------------------------------------
--属性表: 包含属性值(根据物品属性配置来确定属性值的数量) --该函数可以自由发挥
定义函数 通用_存仓属性过滤(属性表)
    局部变量 属性数量 = 0
    如果 type(属性表) ~= "table" then
        LogE("存仓属性过滤错误")
        返回 假
    结束
    局部变量 装备类型 = 属性表["物品类型"] 
    如果 装备类型 == 空 那么
        LogE("过滤物品属性之物品类型参数错误， 不能继续解析该装备属性")
        返回 假
    结束
    局部变量 属性信息  = 属性表["属性信息"]
    如果 属性信息 == 空 那么
        LogE("过滤物品属性之该物品属性信息为空 ")
        返回 假
    结束
----------------------------【戒指与项链】
    如果 装备类型 == 物品类型.项链 或 装备类型 == 物品类型.戒指 那么
	    -- "通用_XXXX存仓属性过滤(属性表,满足条数,数值满足条数)"
		--"属性表"不用修改。
		--"满足条数":代表当前物品类型下，定义属性名条数符合多少条存仓（自定义，不建议超过5）。
		--"数值满足条数":代表当前物品类型下，定义属性名条数与对应条数的数值达到或超越 多少条存仓。（自定义，不建议超过"满足条件"的赋值）
        --以下类同函数，以此类推。同理。
		返回 通用_项链和戒指存仓属性过滤(属性表,3,3)
----------------------------【胸甲与盾】
    否则如果 装备类型 == 物品类型.胸甲 或 装备类型 == 物品类型.盾 那么
        返回 通用_衣服存仓属性过滤(属性表,3,3)
----------------------------【头部】
		否则如果 装备类型  ==  物品类型.头部   那么
        返回 通用_头部存仓属性过滤(属性表,3,3)
----------------------------【腰带】
		否则如果 装备类型  ==  物品类型.腰带 那么
        返回 通用_腰带存仓属性过滤(属性表,3,3)
----------------------------【手套】
    否则如果 装备类型  ==  物品类型.手套 那么
        返回 通用_手套存仓属性过滤(属性表,3,3)
----------------------------【武器：爪、匕首、法杖、单手剑、细剑、单手斧、单手锤、弓、箭袋、长杖、双手剑、双手斧、双手锤、短杖】
    否则如果 装备类型  ==  物品类型.法杖 或 装备类型 == 物品类型.短杖 或 装备类型 == 物品类型.双手锤 或 装备类型 == 物品类型.匕首 或 装备类型 == 物品类型.单手剑 或 装备类型 == 物品类型.细剑 或 装备类型 == 物品类型.单手斧 或 装备类型 == 物品类型.单手锤 或 装备类型 == 物品类型.弓 或 装备类型 == 物品类型.箭袋 或 装备类型 == 物品类型.长杖 或 装备类型 == 物品类型.双手剑 或 装备类型 == 物品类型.双手斧 那么
        返回 通用_武器存仓属性过滤(属性表,3,3)
    否则
        返回  假
    结束
结束
------------------【以上是存仓属性过滤】

--------------------异界地图属性过滤------------------------------
--返回 真: 表示参与过滤;
--返回 假: 不会过滤
定义函数 通用_地图属性过滤(属性表)
    局部变量 属性信息 = 属性表["属性信息"]
    如果 属性信息["怪物反射"] 那么
        返回 假
    结束
    返回 真    
结束
----------------------------------------------------------