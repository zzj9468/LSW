SET NAMES UTF8;
DROP DATABASE IF EXISTS lsw;
CREATE DATABASE lsw CHARSET=UTF8;
USE lsw;
#首页轮播图
CREATE TABLE lsw_index_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(64),
    title VARCHAR(128),
    href VARCHAR(32)
);
#轮播图---插入数据
INSERT INTO lsw_index_carousel  VALUES
        (NULL,'img/index/carousel/banner_1.jpg','感恩回馈','details.html?cid=66'),
        (NULL,'img/index/carousel/banner_2.jpg','甜蜜味蕾','details.html?cid=95'),
        (NULL,'img/index/carousel/banner_3.jpg','你的薯愿','details.html?cid=88'),
        (NULL,'img/index/carousel/banner_4.jpg','热卖爆款','details.html?cid=74');

#每日秒杀
CREATE TABLE lsw_index_miaosha(
    mid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(32),
    title VARCHAR(32),
    subtitle VARCHAR(32),
    price INT,
    href VARCHAR(32)
);
#每日秒杀---插入数据
INSERT INTO lsw_index_miaosha VALUES
    (NULL,'img/sm/5f_1.8.jpg','TOMS蜂蜜黄油扁桃仁35g','TOMS蜂蜜黄油扁桃仁35g',5.00,'details.html?lid=95'),
    (NULL,'img/sm/5f_1.1.jpg','淘豆原味豌豆*100g 约4袋','淘豆原味豌豆*100g 约4袋',3.50,'details.html?lid=88'),
    (NULL,'img/sm/3f_3.7.jpg','巧妈妈奇异果果汁果冻果蜜味125g','巧妈妈奇异果果汁果冻果蜜味125g',4.00,'details.html?lid=71'),
    (NULL,'img/sm/3f_2.2.jpg','润谷筒装果汁软糖杂果味75g','润谷筒装果汁软糖杂果味75g',5.50,'details.html?lid=58'),
    (NULL,'img/sm/2f_2.3.jpg','母亲牛肉棒原味22g','母亲牛肉棒原味22g',5.50,'details.html?lid=43'),
    (NULL,'img/sm/2f_1.8.jpg','啃馋你辣霸天下酱烤辣味鸭掌46g','啃馋你辣霸天下酱烤辣味鸭掌46g',3.80,'details.html?lid=40'),
    (NULL,'img/sm/1f_4.1.jpg','格力高百力滋蓝莓芝士味45g','格力高百力滋蓝莓芝士味45g',4.00,'details.html?lid=25'),
    (NULL,'img/sm/1f_1.3.jpg','掌柜达人原味小麻花*200g 约25袋','掌柜达人原味小麻花*200g 约25袋',6.50,'details.html?lid=3');

#热卖推荐
CREATE TABLE lsw_index_hot(
    hid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(32),
    title VARCHAR(32),
    subtitle VARCHAR(32),
    price INT,
    href VARCHAR(32)
);
#热卖推荐---插入数据
INSERT INTO lsw_index_hot VALUES
    (NULL,'img/sm/5f_1.5.jpg','甘源酱汁蚕豆牛肉味*500g 约35小包','甘源酱汁蚕豆牛肉味*500g 约35小包',16.50,'details.html?lid=92'),
    (NULL,'img/sm/4f_2.1.jpg','雪海梅乡盐津葡萄220g','雪海梅乡盐津葡萄220g',9.90,'details.html?lid=81'),
    (NULL,'img/sm/4f_1.1.jpg','零度深林零度杨梅原味*275g 约7个','零度深林零度杨梅原味*275g 约7个',13.80,'details.html?lid=73'),
    (NULL,'img/sm/3f_3.2.jpg','盛香珍芒果布丁330g','盛香珍芒果布丁330g',11.00,'details.html?lid=66'),
    (NULL,'img/sm/3f_1.4.jpg','不二家香醇牛奶硬质奶糖原味 40g','不二家香醇牛奶硬质奶糖原味 40g',9.80,'details.html?lid=52'),
    (NULL,'img/sm/2f_1.3.jpg','骥洋小鸡腿*500g 约17小包','骥洋小鸡腿*500g 约17小包',32.80,'details.html?lid=35'),
    (NULL,'img/sm/1f_3.5.jpg','丽芝士纳宝帝奶酪威化饼干350g','丽芝士纳宝帝奶酪威化饼干350g',23.80,'details.html?lid=21'),
    (NULL,'img/sm/4f_1.4.jpg','果然萌秋葵脆58g','果然萌秋葵脆58g',15.50,'details.html?lid=76');

#楼层导航数据表
CREATE TABLE lsw_index_family(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32)
);
#楼层导航--插入数据
INSERT INTO lsw_index_family VALUES
    (NULL,'饼干糕点'),
    (NULL,'肉类制品'),
    (NULL,'糖果巧克力'),
    (NULL,'蜜饯果干'),
    (NULL,'坚果炒货');

#创建楼层内容表
CREATE TABLE lsw_index_product(
	  pid INT PRIMARY KEY AUTO_INCREMENT,
	  fid INT,
	  title VARCHAR(32),
	  subtitle VARCHAR(32),
	  prices INT,
	  imgs VARCHAR(32),
	  hrefs VARCHAR(32)
);
#楼层内容--插入数据
INSERT INTO lsw_index_product VALUES
    (NULL,1,'嘉友大乃牛炼奶味饼干*250g','嘉友大乃牛炼奶味饼干*250g 约7包',6.00,'img/sm/1f_1.1.jpg','details.html?lid=1'),
    (NULL,1,'丽能压缩饼干葱油味*500g','丽能压缩饼干葱油味*500g',19.80,'img/sm/1f_1.2.jpg','details.html?lid=2'),
    (NULL,1,'掌柜达人原味小麻花*200g','掌柜达人原味小麻花*200g ',6.50,'img/sm/1f_1.3.jpg','details.html?lid=3'),
    (NULL,1,'美伦多咸蛋黄饼干80g','美伦多咸蛋黄饼干80g',10.00,'img/sm/1f_1.4.jpg','details.html?lid=4'),
    (NULL,1,'福喜居台湾小馒头原味*250g','福喜居台湾小馒头原味*250g',8.50,'img/sm/1f_1.5.jpg','details.html?lid=5'),
    (NULL,1,'丽芝士芝心棒夹心卷(注心饼干)180g','丽芝士芝心棒夹心卷(注心饼干)180g',9.90,'img/sm/1f_1.6.jpg','details.html?lid=6'),
    (NULL,1,'我本满足紫菜肉松蛋卷225g','我本满足紫菜肉松蛋卷225g',14.50,'img/sm/1f_1.7.jpg','details.html?lid=7'),
    (NULL,1,'阿婆家的麻糬红豆味*500g 约8袋','阿婆家的麻糬红豆味*500g 约8袋',12.50,'img/sm/1f_1.8.jpg','details.html?lid=8'),
    (NULL,1,'莱家粒粒威化黑巧克力味125g','莱家粒粒威化黑巧克力味125g',16.00,'img/sm/1f_2.1.jpg','details.html?lid=9'),
    (NULL,1,'莱家粒粒威化提拉米苏味110g','莱家粒粒威化提拉米苏味110g',16.00,'img/sm/1f_2.2.jpg','details.html?lid=10'),
    (NULL,1,'莱家粒粒威化黑加仑味110g','莱家粒粒威化黑加仑味110g',16.00,'img/sm/1f_2.3.jpg','details.html?lid=11'),
    (NULL,1,'莱家粒粒威化卡布奇诺味110g','莱家粒粒威化卡布奇诺味110g',16.00,'img/sm/1f_2.4.jpg','details.html?lid=12'),
    (NULL,1,'莱家粒粒威化巧克力味125g','莱家粒粒威化巧克力味125g',16.00,'img/sm/1f_2.5.jpg','details.html?lid=13'),
    (NULL,1,'南益巧克力口味威化饼干200g','南益巧克力口味威化饼干200g',12.00,'img/sm/1f_2.6.jpg','details.html?lid=14'),
    (NULL,1,'丽芝士纳宝帝奶酪威化饼干350g','丽芝士纳宝帝奶酪威化饼干350g',23.80,'img/sm/1f_2.7.jpg','details.html?lid=15'),
    (NULL,1,'南益柠檬口味威化饼干200g','南益柠檬口味威化饼干200g',11.00,'img/sm/1f_2.8.jpg','details.html?lid=16'),
    (NULL,1,'丽芝士纳宝帝奶酪威化饼干145g','丽芝士纳宝帝奶酪威化饼干145g',6.00,'img/sm/1f_3.1.jpg','details.html?lid=17'),
    (NULL,1,'丽芝士雅嘉奶酪味夹心玉米棒400g','丽芝士雅嘉奶酪味夹心玉米棒400g',21.80,'img/sm/1f_3.2.jpg','details.html?lid=18'),
    (NULL,1,'丽芝士雅嘉奶酪玉米棒160g','丽芝士雅嘉奶酪玉米棒160g',9.90,'img/sm/1f_3.3.jpg','details.html?lid=19'),
    (NULL,1,'丽芝士芝心棒夹心卷(注心饼干)180g','丽芝士芝心棒夹心卷(注心饼干)180g',9.90,'img/sm/1f_3.4.jpg','details.html?lid=20'),
    (NULL,1,'丽芝士纳宝帝奶酪威化饼干350g','丽芝士纳宝帝奶酪威化饼干350g',23.80,'img/sm/1f_3.5.jpg','details.html?lid=21'),
    (NULL,1,'丽芝士纳宝帝奶酪威化饼干200g','丽芝士纳宝帝奶酪威化饼干200g',9.90,'img/sm/1f_3.6.jpg','details.html?lid=22'),
    (NULL,1,'丽芝士纳宝帝奶酪威化饼干58g','丽芝士纳宝帝奶酪威化饼干58g',2.00,'img/sm/1f_3.7.jpg','details.html?lid=23'),
    (NULL,1,'AJI尼西亚惊奇饼起士味200g（袋）','AJI尼西亚惊奇饼起士味200g（袋）',7.80,'img/sm/1f_3.8.jpg','details.html?lid=24'),
    (NULL,1,'格力高百力滋蓝莓芝士味45g','格力高百力滋蓝莓芝士味45g',4.00,'img/sm/1f_4.1.jpg','details.html?lid=25'),
    (NULL,1,'格力高百力滋抹茶香草味45g','格力高百力滋抹茶香草味45g',4.00,'img/sm/1f_4.2.jpg','details.html?lid=26'),
    (NULL,1,'格力高百醇抹茶慕斯味48g','格力高百醇抹茶慕斯味48g',5.50,'img/sm/1f_4.3.jpg','details.html?lid=27'),
    (NULL,1,'格力高百醇红酒巧克力味48g','格力高百醇红酒巧克力味48g',5.50,'img/sm/1f_4.4.jpg','details.html?lid=28'),
    (NULL,1,'格力高百力滋蓝莓芝士味45g*12盒','格力高百力滋蓝莓芝士味45g*12盒',45.00,'img/sm/1f_4.5.jpg','details.html?lid=29'),
    (NULL,1,'甜甜乐星球杯巧克力饼干（大杯）390g','甜甜乐星球杯巧克力饼干（大杯）390g',14.00,'img/sm/1f_4.6.jpg','details.html?lid=30'),
    (NULL,1,'芭米手工牛扎饼奶盐味148g','芭米手工牛扎饼奶盐味148g',8.50,'img/sm/1f_4.7.jpg','details.html?lid=31'),
    (NULL,1,'芭米手工牛扎饼海苔味148g','芭米手工牛扎饼海苔味148g',8.50,'img/sm/1f_4.8.jpg','details.html?lid=32'),


    (NULL,2,'啃馋你酱烤原味小鸡腿42g','啃馋你酱烤原味小鸡腿42g',3.80,'img/sm/2f_1.1.jpg','details.html?lid=33'),
    (NULL,2,'客家功夫泡鸡爪（香辣味）*265g 约7袋','客家功夫泡鸡爪（香辣味）*265g 约7袋',12.50,'img/sm/2f_1.2.jpg','details.html?lid=34'),
    (NULL,2,'骥洋小鸡腿*500g 约17小包','骥洋小鸡腿*500g 约17小包',32.80,'img/sm/2f_1.3.jpg','details.html?lid=35'),
    (NULL,2,'有友泡凤爪椒香味80g','有友泡凤爪椒香味80g',4.20,'img/sm/2f_1.4.jpg','details.html?lid=36'),
    (NULL,2,'修文鸭里脊*250g 约12小袋','修文鸭里脊*250g 约12小袋',14.50,'img/sm/2f_1.5.jpg','details.html?lid=37'),
    (NULL,2,'啃馋你酱烤原味鸭掌46g','啃馋你酱烤原味鸭掌46g',3.80,'img/sm/2f_1.6.jpg','details.html?lid=38'),
    (NULL,2,'啃馋你酱烤原味鸭肫36g','啃馋你酱烤原味鸭肫36g',3.80,'img/sm/2f_1.7.jpg','details.html?lid=39'),
    (NULL,2,'啃馋你辣霸天下酱烤辣味鸭掌46g','啃馋你辣霸天下酱烤辣味鸭掌46g',3.80,'img/sm/2f_1.8.jpg','details.html?lid=40'),
    (NULL,2,'牛浪汉麻辣牛肉60g','牛浪汉麻辣牛肉60g',6.00,'img/sm/2f_2.1.jpg','details.html?lid=41'),
    (NULL,2,'牛浪汉泡椒牛肉60g','牛浪汉泡椒牛肉60g',6.00,'img/sm/2f_2.2.jpg','details.html?lid=42'),
    (NULL,2,'母亲牛肉棒原味22g','母亲牛肉棒原味22g',5.50,'img/sm/2f_2.3.jpg','details.html?lid=43'),
    (NULL,2,'母亲牛肉棒辣味22g','母亲牛肉棒辣味22g',5.50,'img/sm/2f_2.4.jpg','details.html?lid=44'),
    (NULL,2,'母亲牛肉棒辣味22g*3包','母亲牛肉棒辣味22g*3包',15.00,'img/sm/2f_2.5.jpg','details.html?lid=45'),
    (NULL,2,'牛浪汉泡椒牛肉60g*3包','牛浪汉泡椒牛肉60g*3包',18.00,'img/sm/2f_2.6.jpg','details.html?lid=46'),
    (NULL,2,'母亲牛肉棒黑椒味22g','母亲牛肉棒黑椒味22g',5.50,'img/sm/2f_2.7.jpg','details.html?lid=47'),
    (NULL,2,'Kang’s牛肉干黑椒味80g','Kang’s牛肉干黑椒味80g',13.00,'img/sm/2f_2.8.jpg','details.html?lid=48'),


    (NULL,3,'Hello Kitty果汁软糖混合水','Hello Kitty果汁软糖混合水',13.00,'img/sm/3f_1.1.jpg','details.html?lid=49'),
    (NULL,3,'Blink冰力克果粉含片糖(青苹果味味)15g','Blink冰力克果粉含片糖(青苹果味味)15g',16.00,'img/sm/3f_1.2.jpg','details.html?lid=50'),
    (NULL,3,'顽皮兔可吸冰淇淋奶昔果冻芒果味85g','顽皮兔可吸冰淇淋奶昔果冻芒果味85g',1.50,'img/sm/3f_1.3.jpg','details.html?lid=51'),
    (NULL,3,'不二家香醇牛奶硬质奶糖原味 40g','不二家香醇牛奶硬质奶糖原味 40g',9.80,'img/sm/3f_1.4.jpg','details.html?lid=52'),
    (NULL,3,'嘉云牌柠檬糖果200g','嘉云牌柠檬糖果200g',14.00,'img/sm/3f_1.5.jpg','details.html?lid=53'),
    (NULL,3,'盛香珍可爱狗狗布丁630g','盛香珍可爱狗狗布丁630g',45.00,'img/sm/3f_1.6.jpg','details.html?lid=54'),
    (NULL,3,'大眼萌小黄人零钱包糖果15g','大眼萌小黄人零钱包糖果15g',13.50,'img/sm/3f_1.7.jpg','details.html?lid=55'),
    (NULL,3,'贝欧宝玫瑰花瓣糖45g','贝欧宝玫瑰花瓣糖45g',4.90,'img/sm/3f_1.8.jpg','details.html?lid=56'),
    (NULL,3,'大润谷哆啦A梦什果味哈Q糖（造形胶罐）40g','大润谷哆啦A梦什果味哈Q糖（造形胶罐）40g',10.00,'img/sm/3f_2.1.jpg','details.html?lid=57'),
    (NULL,3,'润谷筒装果汁软糖杂果味75g','润谷筒装果汁软糖杂果味75g',5.50,'img/sm/3f_2.2.jpg','details.html?lid=58'),
    (NULL,3,'口力汉堡橡皮糖108g','口力汉堡橡皮糖108g',7.50,'img/sm/3f_2.3.jpg','details.html?lid=59'),
    (NULL,3,'大润谷哆啦A梦草莓味哈Q糖（坐姿造形胶罐）45g','大润谷哆啦A梦草莓味哈Q糖（坐姿造形胶罐）45g',10.00,'img/sm/3f_2.4.jpg','details.html?lid=60'),
    (NULL,3,'Hello Kitty果汁软糖芒果味（直身造型罐）80g','Hello Kitty果汁软糖芒果味（直身造型罐）80g',18.00,'img/sm/3f_2.5.jpg','details.html?lid=61'),
    (NULL,3,'Hello Kitty果汁软糖混合水果味（杯装造型）90g','Hello Kitty果汁软糖混合水果味（杯装造型）90g',13.00,'img/sm/3f_2.6.jpg','details.html?lid=62'),
    (NULL,3,'大润谷哆啦A梦葡萄味脆皮软糖（坐姿造形胶罐）45g','大润谷哆啦A梦葡萄味脆皮软糖（坐姿造形胶罐）45g',10.00,'img/sm/3f_2.7.jpg','details.html?lid=63'),
    (NULL,3,'Hello Kitty果汁软糖心形罐50g','Hello Kitty果汁软糖心形罐50g',12.00,'img/sm/3f_2.8.jpg','details.html?lid=64'),
    (NULL,3,'Hello Kitty果汁软糖心形罐50g','Hello Kitty果汁软糖心形罐50g',11.00,'img/sm/3f_3.1.jpg','details.html?lid=65'),
    (NULL,3,'盛香珍芒果布丁330g','盛香珍芒果布丁330g',11.00,'img/sm/3f_3.2.jpg','details.html?lid=66'),
    (NULL,3,'盛香珍布丁（水蜜桃口味）330g','盛香珍布丁（水蜜桃口味）330g',11.00,'img/sm/3f_3.3.jpg','details.html?lid=67'),
    (NULL,3,'盛香珍Triko粉红小熊桶(果汁果冻)580g','盛香珍Triko粉红小熊桶(果汁果冻)580g',48.00,'img/sm/3f_3.4.jpg','details.html?lid=68'),
    (NULL,3,'盛香珍Triko小熊果冻桶优酪园(綜合口味)580g','盛香珍Triko小熊果冻桶优酪园(綜合口味)580g',48.00,'img/sm/3f_3.5.jpg','details.html?lid=69'),
    (NULL,3,'巧妈妈鸡蛋布甸优酪果冻125g','巧妈妈鸡蛋布甸优酪果冻125g',4.00,'img/sm/3f_3.6.jpg','details.html?lid=70'),
    (NULL,3,'巧妈妈奇异果果汁果冻果蜜味125g','巧妈妈奇异果果汁果冻果蜜味125g',4.00,'img/sm/3f_3.7.jpg','details.html?lid=71'),
    (NULL,3,'巧妈妈香蕉牛奶布甸果冻165g','巧妈妈香蕉牛奶布甸果冻165g',4.00,'img/sm/3f_3.8.jpg','details.html?lid=72'),


    (NULL,4,'零度深林零度杨梅原味*275g 约7个','零度深林零度杨梅原味*275g 约7个',13.80,'img/sm/4f_1.1.jpg','details.html?lid=73'),
    (NULL,4,'溜溜梅梅大大黄梅400g','溜溜梅梅大大黄梅400g',30.00,'img/sm/4f_1.2.jpg','details.html?lid=74'),
    (NULL,4,'春如四季奇异果干*265g 约6袋','春如四季奇异果干*265g 约6袋',11.50,'img/sm/4f_1.3.jpg','details.html?lid=75'),
    (NULL,4,'果然萌秋葵脆58g','果然萌秋葵脆58g',15.50,'img/sm/4f_1.4.jpg','details.html?lid=76'),
    (NULL,4,'百年树健康红枣*250g','百年树健康红枣*250g',9.50,'img/sm/4f_1.5.jpg','details.html?lid=77'),
    (NULL,4,'百年树桂圆肉*500g 约12小袋','百年树桂圆肉*500g 约12小袋',44.80,'img/sm/4f_1.6.jpg','details.html?lid=78'),
    (NULL,4,'百年树香菇脆*280g 约6包','百年树香菇脆*280g 约6包',45.50,'img/sm/4f_1.7.jpg','details.html?lid=79'),
    (NULL,4,'百年树榴莲干约45g*1袋','百年树榴莲干约45g*1袋',12.80,'img/sm/4f_1.8.jpg','details.html?lid=80'),
    (NULL,4,'雪海梅乡盐津葡萄220g','雪海梅乡盐津葡萄220g',9.90,'img/sm/4f_2.1.jpg','details.html?lid=81'),
    (NULL,4,'雪海梅乡珍珠梅230g','雪海梅乡珍珠梅230g',9.90,'img/sm/4f_2.2.jpg','details.html?lid=82'),
    (NULL,4,'雪海梅乡黑加仑230g','雪海梅乡黑加仑230g',9.90,'img/sm/4f_2.3.jpg','details.html?lid=83'),
    (NULL,4,'雪海梅乡法式樱桃200g','雪海梅乡法式樱桃200g',9.90,'img/sm/4f_2.4.jpg','details.html?lid=84'),
    (NULL,4,'雪海梅乡法式樱桃200g','雪海梅乡法式樱桃200g',9.90,'img/sm/4f_2.5.jpg','details.html?lid=85'),
    (NULL,4,'雪海梅乡冰花杨梅210g','雪海梅乡冰花杨梅210g',9.90,'img/sm/4f_2.6.jpg','details.html?lid=86'),
    (NULL,4,'三味轩日式去核梅蜂蜜味60g','三味轩日式去核梅蜂蜜味60g',5.50,'img/sm/4f_2.7.jpg','details.html?lid=87'),


    (NULL,5,'淘豆原味豌豆*100g 约4袋','淘豆原味豌豆*100g 约4袋',3.50,'img/sm/5f_1.1.jpg','details.html?lid=88'),
    (NULL,5,'芳草美仁盐焗南瓜子*250g 约11袋','芳草美仁盐焗南瓜子*250g 约11袋',9.80,'img/sm/5f_1.2.jpg','details.html?lid=89'),
    (NULL,5,'佳栗福甘栗开口栗180g','佳栗福甘栗开口栗180g',12.00,'img/sm/5f_1.3.jpg','details.html?lid=90'),
    (NULL,5,'爱咪咪鱼皮花生*500g 约11小袋','爱咪咪鱼皮花生*500g 约11小袋',12.00,'img/sm/5f_1.4.jpg','details.html?lid=91'),
    (NULL,5,'甘源酱汁蚕豆牛肉味*500g 约35小包','甘源酱汁蚕豆牛肉味*500g 约35小包',16.50,'img/sm/5f_1.5.jpg','details.html?lid=92'),
    (NULL,5,'芳草香草瓜子218g','芳草香草瓜子218g',14.00,'img/sm/5f_1.6.jpg','details.html?lid=93'),
    (NULL,5,'沃隆每日坚果A款 成人款25g','沃隆每日坚果A款 成人款25g',3.80,'img/sm/5f_1.7.jpg','details.html?lid=94'),
    (NULL,5,'TOMS蜂蜜黄油扁桃仁35g','TOMS蜂蜜黄油扁桃仁35g',5.00,'img/sm/5f_1.8.jpg','details.html?lid=95');

#创建详情页数据
CREATE TABLE lsw_details(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    fid INT,
    oid INT,
    title VARCHAR(32),           #名称
    price DECIMAL(10,2),         #现价
    prev_price DECIMAL(10,2),    #市场价
    yh_price DECIMAL(10,2),     #优惠价格
    bianhao VARCHAR(32),        #编号
    pingpai VARCHAR(16),        #品牌
    chandi VARCHAR(32),         #产地
    kouwei VARCHAR(16),         #口味
    guige VARCHAR(16),          #规格
    jifen  INT,                 #积分
    zhonglei VARCHAR(16),       #种类
    dates VARCHAR(16),          #保质期
    img VARCHAR(32)             #详情大图
);

#详情页--插入数据
INSERT INTO lsw_details VALUES
    (NULL,1,1,'嘉友大乃牛炼奶味饼干*250g',6.00,7.5,5.4,01001,'嘉友','广东','炼奶味','250克','6分','饼干','12个月','img/details/lg/f1_01_lg.jpg'),
    (NULL,1,2,'丽能压缩饼干葱油味*500g',19.8,24.75,17.82,01002,'丽能','福建','葱油味','500克','19分','饼干','12个月','img/details/lg/f1_02_lg.jpg'),
    (NULL,1,3,'掌柜达人原味小麻花*200g 约25袋',6.5,8.12,5.85,01003,'掌柜达人','重庆','原味','200克','6分','饼干','12个月','img/details/lg/f1_03_lg.jpg'),
    (NULL,1,4,'美伦多咸蛋黄饼干80g',10,12.5,9,01004,'美伦多','山东','咸蛋黄味','100克','10分','饼干','12个月','img/details/lg/f1_04_lg.jpg'),
    (NULL,1,5,'福喜居台湾小馒头原味*250g',8.5,10.65,7.65,01005,'福喜居','江苏','原味','280克','8分','饼干','12个月','img/details/lg/f1_05_lg.jpg'),
    (NULL,1,6,'丽芝士芝心棒夹心卷(注心饼干)180g',9.9,12.35,8.91,01006,'丽芝士','印尼','原味','250克','9分','威化饼','12个月','img/details/lg/f1_06_lg.jpg'),
    (NULL,1,7,'我本满足紫菜肉松蛋卷225g',14.25,18.15,13.05,01007,'我本满足','广东','紫菜味','320克','14分','蛋卷/酥/松塔/糕点','12个月','img/details/lg/f1_07_lg.jpg'),
    (NULL,1,8,'阿婆家的麻糬红豆味*500g 约8袋',12.50,15.65,11.25,01008,'阿婆家','浙江','红豆味','500克','12分','糕点','6个月','img/details/lg/f1_08_lg.jpg'),
    (NULL,1,1,'莱家粒粒威化黑巧克力味125g',16,20,14.4,01009,'莱家','欧美','巧克力味','135克','16分','威化饼','18个月','img/details/lg/f1_09_lg.jpg'),
    (NULL,1,2,'莱家粒粒威化提拉米苏味110g',16,20,14.4,01010,'莱家','欧美','提拉米苏味','120克','16分','威化饼','18个月','img/details/lg/f1_010_lg.jpg'),
    (NULL,1,3,'莱家粒粒威化黑加仑味110g',16,20,14.4,01011,'莱家','欧美','水果味','120克','16分','威化饼','18个月','img/details/lg/f1_11_lg.jpg'),
    (NULL,1,4,'莱家粒粒威化卡布奇诺味110g',16,20,14.4,01012,'莱家','欧美','卡布奇诺味','120克','16分','威化饼','18个月',null),
    (NULL,1,5,'莱家粒粒威化巧克力味125g',16,20,14.4,01013,'莱家','欧美','巧克力味','135克','16分','威化饼','18个月',null),
    (NULL,1,6,'南益巧克力口味威化饼干200g',12,15,10.8,01014,'南益','马来西亚','巧克力味','220克','12分','威化饼','12个月',null),
    (NULL,1,7,'丽芝士纳宝帝奶酪威化饼干350g',23.8,29.75,21.42,01015,'丽芝士','印尼','奶酪味','250克','23分','威化饼','12个月','img/details/lg/f1_15_lg.jpg'),
    (NULL,1,8,'南益柠檬口味威化饼干200g',11,13.75,9.9,01016,'南益','马来西亚','原味','210克','11分','威化饼','12个月',null),
    (NULL,1,1,'丽芝士纳宝帝奶酪威化饼干145g',6,7.5,5.4,01017,'丽芝士','印尼','奶酪味','150克','6分','威化饼','12个月',null),
    (NULL,1,2,'丽芝士雅嘉奶酪味夹心玉米棒400g',21.8,21.75,19.65,01018,'丽芝士','印尼','原味','200克','21分','威化饼','12个月',null),
    (NULL,1,3,'丽芝士雅嘉奶酪玉米棒160g',9.90,12.5,8.91,01019,'丽芝士','印尼','玉米味','250克','9分','威化饼','12个月',null),
    (NULL,1,4,'丽芝士芝心棒夹心卷(注心饼干)180g',9.90,12.375,8.91,01020,'丽芝士','印尼','原味','250克','9分','威化饼','12个月',null),
    (NULL,1,5,'丽芝士纳宝帝奶酪威化饼干350g',23.80,29.75,21.42,01021,'丽芝士','印尼','原味','450克','23分','威化饼','12个月',null),
    (NULL,1,6,'丽芝士纳宝帝奶酪威化饼干200g',9.90,12.5,8.91,01022,'丽芝士','印尼','原味','250克','9分','威化饼','12个月',null),
    (NULL,1,7,'丽芝士纳宝帝奶酪威化饼干58g',2.00,2.5,1.8,01023,'丽芝士','印尼','原味','80克','2分','威化饼','12个月',null),
    (NULL,1,8,'AJI尼西亚惊奇饼起士味200g（袋）',7.8,9.15,7.02,01024,'AJI','台湾','原味','200克','11分','饼干','12个月',null),
    (NULL,1,1,'格力高百力滋蓝莓芝士味45g',4,5,3.6,01025,'格力高','上海','水果味','63克','4分','涂层饼干','12个月',null),
    (NULL,1,2,'格力高百力滋抹茶香草味45g',4,5,3.6,01026,'格力高','上海','水果味','67克','4分','涂层饼干','12个月',null),
    (NULL,1,3,'格力高百醇抹茶慕斯味48g',6.5,6.875,4.95,01027,'格力高','上海','水果味','69克','5分','涂层饼干','12个月',null),
    (NULL,1,4,'格力高百醇红酒巧克力味48g',5.5,6.85,4.95,01028,'格力高','上海','甜味','70克','5分','涂层饼干','12个月',null),
    (NULL,1,5,'格力高百力滋蓝莓芝士味45g*12盒',45,56.25,40.5,01029,'格力高','上海','水果味','540克','45分','涂层饼干','12个月',null),
    (NULL,1,6,'甜甜乐星球杯巧克力饼干（大杯）390g',14,17.5,12.6,01030,'甜甜乐','广东','水果味','450克','14分','饼干','12个月',null),
    (NULL,1,7,'芭米手工牛扎饼奶盐味148g',8.5,10.3,7.65,01031,'芭米','上海','咸味','155克','8分','饼干','6个月',null),
    (NULL,1,8,'芭米手工牛扎饼海苔味148g',8.5,10.5,7.65,01032,'芭米','上海','咸味','155克','8分','饼干','6个月',null),


    (NULL,2,1,'啃馋你酱烤原味小鸡腿42g',3.8,4.75,3.42,01033,'啃馋你','福建','原味','265克','12分','','12个月',null),
    (NULL,2,2,'客家功夫泡鸡爪（香辣味）*265g 约7袋',12.5,15.625,11.25,01034,'客家功夫','福建','原味','265克','12分','鸡肉制品','12个月',null),
    (NULL,2,3,'骥洋小鸡腿*500g 约17小包',32.8,41,29.52,01035,'骥洋','福建','原味','500克','32分','鸡肉制品','9个月',null),
    (NULL,2,4,'有友泡凤爪椒香味80g',4.5,5.25,3.78,01036,'有友','重庆','原味','95克','4分','鸡肉制品','6个月',null),
    (NULL,2,5,'修文鸭里脊*250g 约12小袋',14.5,18.125,13.05,01037,'修文','浙江','原味','250克','14分','鸡肉制品','10个月',null),
    (NULL,2,6,'啃馋你酱烤原味鸭掌46g',3.8,4.5,3.5,01038,'啃馋你','江苏','原味','45克','3分','鸭肉制品','9个月',null),
    (NULL,2,7,'啃馋你酱烤原味鸭肫36g',3.8,4.75,3.25,01039,'啃馋你','江苏','原味','55克','3分','鸭肉制品','9个月',null),
    (NULL,2,8,'啃馋你辣霸天下酱烤辣味鸭掌46g',3.8,4.75,3.25,01040,'啃馋你','江苏','辣味','56克','3分','鸭肉制品','9个月',null),
    (NULL,2,1,'牛浪汉麻辣牛肉60g',6,7.5,5.8,01041,'牛浪汉','重庆','辣味','68克','6分','牛肉制品','12个月',null),
    (NULL,2,2,'牛浪汉泡椒牛肉60g',6,7.5,5.4,01042,'牛浪汉','重庆','辣味','67克','6分','牛肉制品','12个月',null),
    (NULL,2,3,'母亲牛肉棒原味22g',5.5,6.6,4.85,01043,'母亲','浙江','辣味','30克','5分','牛肉制品','12个月',null),
    (NULL,2,4,'母亲牛肉棒辣味22g',5.5,6.4,4.85,01044,'母亲','浙江','辣味','30克','5分','牛肉制品','12个月',null),
    (NULL,2,5,'母亲牛肉棒辣味22g*3包',15,18.75,13.5,01045,'母亲','浙江','辣味','90克','15分','牛肉制品','12个月',null),
    (NULL,2,6,'牛浪汉泡椒牛肉60g*3包',18,22.5,16.2,01046,'牛浪汉','重庆','辣味','204克','18分','牛肉制品','12个月',null),
    (NULL,2,7,'母亲牛肉棒黑椒味22g',5.5,6.75,4.9,01047,'母亲','浙江','辣味','30克','5分','牛肉制品','12个月',null),
    (NULL,2,8,'Kang’s牛肉干黑椒味80g',13,16.5,11.7,01048,'KANG\S','广东','辣味','120克','13分','牛肉制品','9个月',null),


    (NULL,3,1,'Hello Kitty果汁软糖混合水',13,16.25,11.7,01049,'HELLO KITTY','广东','水果味','158克','13分','软糖','24个月',null),
    (NULL,3,2,'Blink冰力克果粉含片糖(青苹果味味)15g',11,13.75,9.9,01050,'Blink冰力克','德国','青苹果味','25克','11分','含片','18个月',null),
    (NULL,3,3,'顽皮兔可吸冰淇淋奶昔果冻芒果味85g',1.5,3,1.25,01051,'顽皮兔','浙江','芒果味','85克','3分','果冻布丁','12个月',null),
    (NULL,3,4,'不二家香醇牛奶硬质奶糖原味 40g',9.8,12.5,8.75,01052,'不二家','浙江','原味','95克','9分','硬糖','12个月',null),
    (NULL,3,5,'嘉云牌柠檬糖果200g',14,16.3,12.5,01053,'卡文哈夫','欧美','原味','245克','14分','硬糖','36个月',null),
    (NULL,3,6,'盛香珍可爱狗狗布丁630g',45,65,40.2,01054,'盛香珍','台湾','原味','980克','45分','果冻布丁','12个月',null),
    (NULL,3,7,'大眼萌小黄人零钱包糖果15g',13.5,18.5,11.25,01055,'大眼萌','广东','原味','45克','13分','巧克力','24个月',null),
    (NULL,3,8,'贝欧宝玫瑰花瓣糖45g',4.8,5.9,3.8,01056,'贝欧宝','广东','原味','65克','4分','软糖','12个月',null),
    (NULL,3,1,'大润谷哆啦A梦什果味哈Q糖（造形胶罐）40g',10,12.5,8.9,01057,'哆啦A梦','广东','原味','75克','10分','软糖','12个月',null),
    (NULL,3,2,'润谷筒装果汁软糖杂果味75g',5.5,7.8,4.3,01058,'润谷','广东','杂果味','205克','5分','软糖','24个月',null),
    (NULL,3,3,'口力汉堡橡皮糖108g',7.5,9.3,5.9,01059,'口力','广东','杂果味','124克','7分','软糖','18个月',null),
    (NULL,3,4,'大润谷哆啦A梦草莓味哈Q糖（坐姿造形胶罐）45g',10,12.5,8.9,01060,'哆拉A梦','广东','杂果味','100克','10分','软糖','24个月',null),
    (NULL,3,5,'Hello Kitty果汁软糖芒果味（直身造型罐）80g',18,20.5,16.8,01061,'HELLO KITTY','广东','芒果味','160克','18分','软糖','24个月',null),
    (NULL,3,6,'Hello Kitty果汁软糖混合水果味（杯装造型）90g',13,18,11.8,01062,'HELLO KITTY','广东','混合水果味','158克','13分','软糖','24个月',null),
    (NULL,3,7,'大润谷哆啦A梦葡萄味脆皮软糖（坐姿造形胶罐）45g',10,15,8.9,01063,'大润谷','广东','葡萄味','50克','10分','软糖','24个月',null),
    (NULL,3,8,'Hello Kitty果汁软糖心形罐50g',12,15,10.6,01064,'HELLO KITTY','广东','葡萄味','115克','12分','软糖','24个月',null),
    (NULL,3,1,'Hello Kitty果汁软糖心形罐50g',11,13.5,7.9,01065,'盛香珍','台湾','原味','347克','11分','果冻布丁','12个月',null),
    (NULL,3,2,'盛香珍芒果布丁330g',11,13.5,9.8,01066,'盛香珍','台湾','原味','369克','11分','果冻布丁','12个月',null),
    (NULL,3,3,'盛香珍布丁（水蜜桃口味）330g',11,13.5,9.8,01067,'盛香珍','台湾','水蜜桃口味','375克','11分','果冻布丁','12个月',null),
    (NULL,3,4,'盛香珍Triko粉红小熊桶(果汁果冻)580g',48,53.5,43.5,01068,'盛香珍','台湾','水果味','986克','48分','果冻布丁','12个月',null),
    (NULL,3,5,'盛香珍Triko小熊果冻桶优酪园(綜合口味)580g',4,5.3,3.8,01069,'巧妈妈','安徽','綜合口味','150克','4分','果冻布丁','12个月',null),
    (NULL,3,6,'巧妈妈鸡蛋布甸优酪果冻125g',4,5.3,3.2,01070,'巧妈妈','安徽','綜合口味','150克','4分','果冻布丁','12个月',null),
    (NULL,3,7,'巧妈妈奇异果果汁果冻果蜜味125g',4,5.3,3.7,01071,'巧妈妈','福建','果蜜味','150克','4分','果冻布丁','12个月',null),
    (NULL,3,8,'巧妈妈香蕉牛奶布甸果冻165g',4,5.3,3.7,01072,'巧妈妈','福建','蕉牛味','190克','4分','果冻布丁','12个月',null),


    (NULL,4,1,'零度深林零度杨梅原味*275g 约7个',13.8,15.9,12.1,01073,'零度深林','浙江','原味','275克','13分','梅类','12个月',null),
    (NULL,4,2,'溜溜梅梅大大黄梅400g',30,35.56,28.1,01074,'溜溜梅','安徽','原味','450克','30分','梅类','12个月',null),
    (NULL,4,3,'春如四季奇异果干*265g 约6袋',11.5,14.5,9.86,01075,'春如四季','浙江','原味','265克','14分','果干/蔬菜干/枣','12个月',null),
    (NULL,4,4,'果然萌秋葵脆58g',15.5,20.6,12.3,01076,'果然萌','福建','原味','85克','15分','果干/蔬菜干/枣','9个月',null),
    (NULL,4,5,'百年树健康红枣*250g',9.5,13.5,7.6,01077,'百年树','福建','原味','280克','9分','果干/蔬菜干/枣','9个月',null),
    (NULL,4,6,'百年树桂圆肉*500g 约12小袋',44.8,56.3,28.9,01078,'百年树','江苏','原味','505克','44分','果干/蔬菜干/枣','8个月',null),
    (NULL,4,7,'百年树香菇脆*280g 约6包',45.5,53.6,39.9,01079,'百年树','福建','原味','285克','45分','果干/蔬菜干/枣','8个月',null),
    (NULL,4,8,'百年树榴莲干约45g*1袋',12.8,16.8,10.6,01080,'百年树','江苏','原味','45克','12分','水果干','12个月',null),
    (NULL,4,1,'雪海梅乡盐津葡萄220g',9.9,15.2,7.6,01081,'雪海梅乡','浙江','原味','251克','9分','梅类','12个月',null),
    (NULL,4,2,'雪海梅乡珍珠梅230g',9.9,16.3,7.8,01082,'雪海梅乡','浙江','原味','260克','9分','梅类','12个月',null),
    (NULL,4,3,'雪海梅乡黑加仑230g',9.9,15.3,8.5,01083,'雪海梅乡','浙江','原味','260克','9分','梅类','12个月',null),
    (NULL,4,4,'雪海梅乡法式樱桃200g',9.9,14.2,8.1,01084,'雪海梅乡','浙江','原味','230克','9分','梅类','12个月',null),
    (NULL,4,5,'雪海梅乡法式樱桃200g',9.9,12.5,6.9,01085,'雪海梅乡','浙江','原味','230克','9分','梅类','12个月',null),
    (NULL,4,6,'雪海梅乡冰花杨梅210g',9.9,15.6,8.6,01086,'雪海梅乡','浙江','原味','240克','9分','梅类','12个月',null),
    (NULL,4,7,'三味轩日式去核梅蜂蜜味60g',16.8,24.3,13.5,01087,'三味轩','福建','蜂蜜味','90克','16分','梅类','12个月',null),


    (NULL,5,1,'淘豆原味豌豆*100g 约4袋',4.8,6.3,2.9,01088,'淘豆','江苏','原味','100克','3分','豆类','18个月',null),
    (NULL,5,2,'芳草美仁盐焗南瓜子*250g 约11袋',9.8,13.6,8.4,01089,'芳草','江苏','原味','250克','9分','瓜子','9个月',null),
    (NULL,5,3,'佳栗福甘栗开口栗180g',12.8,16.8,10.6,01090,'佳粟福','河北','原味','200克','12分','栗子','18个月',null),
    (NULL,5,4,'爱咪咪鱼皮花生*500g 约11小袋',9.9,15.2,7.6,01091,'爱咪咪','浙江','原味','500克','12分','花生','12个月',null),
    (NULL,5,5,'甘源酱汁蚕豆牛肉味*500g 约35小包',9.9,16.3,7.8,01092,'甘源','江西','原味','500克','16分','豆类','8个月',null),
    (NULL,5,6,'芳草香草瓜子218g',9.9,15.3,8.5,01093,'芳草','江苏','原味','250克','14分','瓜子','12个月',null),
    (NULL,5,7,'沃隆每日坚果A款 成人款25g',9.9,14.2,8.1,01094,'沃隆','山东','原味','35克','3分','坚果','12个月',null),
    (NULL,5,8,'TOMS蜂蜜黄油扁桃仁35g',9.9,12.5,6.9,01095,'TOMS','韩国','蜂蜜味','40克','5分','坚果','12个月',null);


#创建详详情页图片
CREATE TABLE lsw_detail_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  iid INT,
  snacks_id INT,              #零食编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128)           #中图片路径
);

#详情页图片--插入数据
INSERT INTO lsw_detail_pic VALUES
    (NULL,1,1,'img/details/sm/f1_01_sm1.jpg','img/details/md/f1_01_md1.jpg'),
    (NULL,2,1,'img/details/sm/f1_01_sm2.jpg','img/details/md/f1_01_md2.jpg'),
    (NULL,3,1,'img/details/sm/f1_01_sm3.jpg','img/details/md/f1_01_md3.jpg'),
    (NULL,4,1,'img/details/sm/f1_01_sm4.jpg','img/details/md/f1_01_md4.jpg'),
    (NULL,5,1,'img/details/sm/f1_01_sm5.jpg','img/details/md/f1_01_md5.jpg'),

    (NULL,1,2,'img/details/sm/f1_02_sm1.jpg','img/details/md/f1_02_md1.jpg'),
    (NULL,2,2,'img/details/sm/f1_02_sm2.jpg','img/details/md/f1_02_md2.jpg'),
    (NULL,3,2,'img/details/sm/f1_02_sm3.jpg','img/details/md/f1_02_md3.jpg'),
    (NULL,4,2,'img/details/sm/f1_02_sm4.jpg','img/details/md/f1_02_md4.jpg'),
    (NULL,5,2,'img/details/sm/f1_02_sm5.jpg','img/details/md/f1_02_md5.jpg'),

    (NULL,1,3,'img/details/sm/f1_03_sm1.jpg','img/details/md/f1_03_md1.jpg'),
    (NULL,2,3,'img/details/sm/f1_03_sm2.jpg','img/details/md/f1_03_md2.jpg'),
    (NULL,3,3,'img/details/sm/f1_03_sm3.jpg','img/details/md/f1_03_md3.jpg'),
    (NULL,4,3,'img/details/sm/f1_03_sm4.jpg','img/details/md/f1_03_md4.jpg'),
    (NULL,5,3,'img/details/sm/f1_03_sm5.jpg','img/details/md/f1_03_md5.jpg'),

    (NULL,1,4,'img/details/sm/f1_04_sm1.jpg','img/details/md/f1_04_md1.jpg'),
    (NULL,2,4,'img/details/sm/f1_04_sm2.jpg','img/details/md/f1_04_md2.jpg'),
    (NULL,3,4,'img/details/sm/f1_04_sm2.jpg','img/details/md/f1_04_md2.jpg'),
    (NULL,4,4,'img/details/sm/f1_04_sm3.jpg','img/details/md/f1_04_md3.jpg'),
    (NULL,5,4,'img/details/sm/f1_04_sm4.jpg','img/details/md/f1_04_md4.jpg'),

    (NULL,1,5,'img/details/sm/f1_05_sm1.jpg','img/details/md/f1_05_md1.jpg'),
    (NULL,2,5,'img/details/sm/f1_05_sm2.jpg','img/details/md/f1_05_md2.jpg'),
    (NULL,3,5,'img/details/sm/f1_05_sm3.jpg','img/details/md/f1_05_md3.jpg'),
    (NULL,4,5,'img/details/sm/f1_05_sm4.jpg','img/details/md/f1_05_md4.jpg'),
    (NULL,5,5,'img/details/sm/f1_05_sm5.jpg','img/details/md/f1_05_md5.jpg'),

    (NULL,1,6,'img/details/sm/f1_06_sm1.jpg','img/details/md/f1_06_md1.jpg'),
    (NULL,2,6,'img/details/sm/f1_06_sm2.jpg','img/details/md/f1_06_md2.jpg'),
    (NULL,3,6,'img/details/sm/f1_06_sm3.jpg','img/details/md/f1_06_md3.jpg'),
    (NULL,4,6,'img/details/sm/f1_06_sm4.jpg','img/details/md/f1_06_md4.jpg'),

    (NULL,1,7,'img/details/sm/f1_07_sm1.jpg','img/details/md/f1_07_md1.jpg'),
    (NULL,2,7,'img/details/sm/f1_07_sm2.jpg','img/details/md/f1_07_md2.jpg'),
    (NULL,3,7,'img/details/sm/f1_07_sm3.jpg','img/details/md/f1_07_md3.jpg'),
    (NULL,4,7,'img/details/sm/f1_07_sm4.jpg','img/details/md/f1_07_md4.jpg'),
    (NULL,5,7,'img/details/sm/f1_07_sm5.jpg','img/details/md/f1_07_md5.jpg'),

/************************************从这开始改********************************************/
    (NULL,1,8,'img/details/sm/f1_08_sm1.jpg','img/details/md/f1_08_md1.jpg'),
    (NULL,2,8,'img/details/sm/f1_08_sm2.jpg','img/details/md/f1_08_md2.jpg'),
    (NULL,3,8,'img/details/sm/f1_08_sm3.jpg','img/details/md/f1_08_md3.jpg'),
    (NULL,4,8,'img/details/sm/f1_08_sm4.jpg','img/details/md/f1_08_md4.jpg'),
    (NULL,5,8,'img/details/sm/f1_08_sm5.jpg','img/details/md/f1_08_md5.jpg'),

    (NULL,1,9,'img/details/sm/f1_09_sm1.jpg','img/details/md/f1_09_md1.jpg'),
    (NULL,2,9,'img/details/sm/f1_09_sm2.jpg','img/details/md/f1_09_md2.jpg'),
    (NULL,3,9,'img/details/sm/f1_09_sm3.jpg','img/details/md/f1_09_md3.jpg'),
    (NULL,4,9,'img/details/sm/f1_09_sm4.jpg','img/details/md/f1_09_md4.jpg'),
    (NULL,5,9,'img/details/sm/f1_09_sm5.jpg','img/details/md/f1_09_md5.jpg'),

    (NULL,1,10,'img/details/sm/f1_10_sm1.jpg','img/details/md/f1_10_md1.jpg'),
    (NULL,2,10,'img/details/sm/f1_10_sm2.jpg','img/details/md/f1_10_md2.jpg'),
    (NULL,3,10,'img/details/sm/f1_10_sm3.jpg','img/details/md/f1_10_md3.jpg'),
    (NULL,4,10,'img/details/sm/f1_10_sm4.jpg','img/details/md/f1_10_md4.jpg'),
    (NULL,5,10,'img/details/sm/f1_10_sm5.jpg','img/details/md/f1_10_md5.jpg'),

    (NULL,1,11,'img/details/sm/f1_11_sm1.jpg','img/details/md/f1_11_md1.jpg'),
    (NULL,2,11,'img/details/sm/f1_11_sm2.jpg','img/details/md/f1_11_md2.jpg'),
    (NULL,3,11,'img/details/sm/f1_11_sm3.jpg','img/details/md/f1_11_md3.jpg'),
    (NULL,4,11,'img/details/sm/f1_11_sm4.jpg','img/details/md/f1_11_md4.jpg'),
    (NULL,5,11,'img/details/sm/f1_11_sm5.jpg','img/details/md/f1_11_md5.jpg'),

    (NULL,1,12,'img/details/sm/f1_12_sm1.jpg','img/details/md/f1_12_md1.jpg'),
    (NULL,2,12,'img/details/sm/f1_12_sm2.jpg','img/details/md/f1_12_md2.jpg'),
    (NULL,3,12,'img/details/sm/f1_12_sm3.jpg','img/details/md/f1_12_md3.jpg'),
    (NULL,4,12,'img/details/sm/f1_12_sm4.jpg','img/details/md/f1_12_md4.jpg'),
    (NULL,5,12,'img/details/sm/f1_12_sm5.jpg','img/details/md/f1_12_md5.jpg'),

    (NULL,1,13,'img/details/sm/f1_13_sm1.jpg','img/details/md/f1_13_md1.jpg'),
    (NULL,2,13,'img/details/sm/f1_13_sm2.jpg','img/details/md/f1_13_md2.jpg'),
    (NULL,3,13,'img/details/sm/f1_13_sm3.jpg','img/details/md/f1_13_md3.jpg'),
    (NULL,4,13,'img/details/sm/f1_13_sm4.jpg','img/details/md/f1_13_md4.jpg'),
    (NULL,5,13,'img/details/sm/f1_13_sm5.jpg','img/details/md/f1_13_md5.jpg'),

    (NULL,1,14,'img/details/sm/f1_14_sm1.jpg','img/details/md/f1_14_md1.jpg'),
    (NULL,2,14,'img/details/sm/f1_14_sm2.jpg','img/details/md/f1_14_md2.jpg'),
    (NULL,3,14,'img/details/sm/f1_14_sm3.jpg','img/details/md/f1_14_md3.jpg'),
    (NULL,4,14,'img/details/sm/f1_14_sm4.jpg','img/details/md/f1_14_md4.jpg'),
    (NULL,5,14,'img/details/sm/f1_14_sm5.jpg','img/details/md/f1_14_md5.jpg'),

    (NULL,1,15,'img/details/sm/f1_15_sm1.jpg','img/details/md/f1_15_md1.jpg'),
    (NULL,2,15,'img/details/sm/f1_15_sm2.jpg','img/details/md/f1_15_md2.jpg'),
    (NULL,3,15,'img/details/sm/f1_15_sm3.jpg','img/details/md/f1_15_md3.jpg'),
    (NULL,4,15,'img/details/sm/f1_15_sm4.jpg','img/details/md/f1_15_md4.jpg'),
    (NULL,5,15,'img/details/sm/f1_15_sm5.jpg','img/details/md/f1_15_md5.jpg'),

    (NULL,1,16,'img/details/sm/f1_16_sm1.jpg','img/details/md/f1_16_md1.jpg'),

    (NULL,1,17,'img/details/sm/f1_17_sm1.jpg','img/details/md/f1_17_md1.jpg'),
    (NULL,2,17,'img/details/sm/f1_17_sm2.jpg','img/details/md/f1_17_md2.jpg'),
    (NULL,3,17,'img/details/sm/f1_17_sm3.jpg','img/details/md/f1_17_md3.jpg'),
    (NULL,4,17,'img/details/sm/f1_17_sm4.jpg','img/details/md/f1_17_md4.jpg'),
    (NULL,5,17,'img/details/sm/f1_17_sm5.jpg','img/details/md/f1_17_md5.jpg'),

    (NULL,1,18,'img/details/sm/f1_18_sm1.jpg','img/details/md/f1_18_md1.jpg'),
    (NULL,2,18,'img/details/sm/f1_18_sm2.jpg','img/details/md/f1_18_md2.jpg'),
    (NULL,3,18,'img/details/sm/f1_18_sm3.jpg','img/details/md/f1_18_md3.jpg'),
    (NULL,4,18,'img/details/sm/f1_18_sm4.jpg','img/details/md/f1_18_md4.jpg'),

    (NULL,1,19,'img/details/sm/f1_19_sm1.jpg','img/details/md/f1_19_md1.jpg'),
    (NULL,2,19,'img/details/sm/f1_19_sm2.jpg','img/details/md/f1_19_md2.jpg'),
    (NULL,3,19,'img/details/sm/f1_19_sm3.jpg','img/details/md/f1_19_md3.jpg'),
    (NULL,4,19,'img/details/sm/f1_19_sm4.jpg','img/details/md/f1_19_md4.jpg'),

    (NULL,1,20,'img/details/sm/f1_20_sm1.jpg','img/details/md/f1_20_md1.jpg'),
    (NULL,2,20,'img/details/sm/f1_20_sm2.jpg','img/details/md/f1_20_md2.jpg'),
    (NULL,3,20,'img/details/sm/f1_20_sm3.jpg','img/details/md/f1_20_md3.jpg'),
    (NULL,4,20,'img/details/sm/f1_20_sm4.jpg','img/details/md/f1_20_md4.jpg'),

    (NULL,1,21,'img/details/sm/f1_21_sm1.jpg','img/details/md/f1_21_md1.jpg'),
    (NULL,2,21,'img/details/sm/f1_21_sm2.jpg','img/details/md/f1_21_md2.jpg'),
    (NULL,3,21,'img/details/sm/f1_21_sm3.jpg','img/details/md/f1_21_md3.jpg'),
    (NULL,4,21,'img/details/sm/f1_21_sm4.jpg','img/details/md/f1_21_md4.jpg'),
    (NULL,5,21,'img/details/sm/f1_21_sm5.jpg','img/details/md/f1_21_md5.jpg'),

    (NULL,1,22,'img/details/sm/f1_22_sm1.jpg','img/details/md/f1_22_md1.jpg'),
    (NULL,2,22,'img/details/sm/f1_22_sm2.jpg','img/details/md/f1_22_md2.jpg'),
    (NULL,3,22,'img/details/sm/f1_22_sm3.jpg','img/details/md/f1_22_md3.jpg'),
    (NULL,4,22,'img/details/sm/f1_22_sm4.jpg','img/details/md/f1_22_md4.jpg'),
    (NULL,5,22,'img/details/sm/f1_22_sm5.jpg','img/details/md/f1_22_md5.jpg'),

    (NULL,1,23,'img/details/sm/f1_23_sm1.jpg','img/details/md/f1_23_md1.jpg'),
    (NULL,2,23,'img/details/sm/f1_23_sm2.jpg','img/details/md/f1_23_md2.jpg'),
    (NULL,3,23,'img/details/sm/f1_23_sm3.jpg','img/details/md/f1_23_md3.jpg'),
    (NULL,4,23,'img/details/sm/f1_23_sm4.jpg','img/details/md/f1_23_md4.jpg'),
    (NULL,5,23,'img/details/sm/f1_23_sm5.jpg','img/details/md/f1_23_md5.jpg'),

    (NULL,1,24,'img/details/sm/f1_24_sm1.jpg','img/details/md/f1_24_md1.jpg'),
    (NULL,2,24,'img/details/sm/f1_24_sm2.jpg','img/details/md/f1_24_md2.jpg'),
    (NULL,3,24,'img/details/sm/f1_24_sm3.jpg','img/details/md/f1_24_md3.jpg'),
    (NULL,4,24,'img/details/sm/f1_24_sm4.jpg','img/details/md/f1_24_md4.jpg'),
    (NULL,5,24,'img/details/sm/f1_24_sm5.jpg','img/details/md/f1_24_md5.jpg'),

    (NULL,1,25,'img/details/sm/f1_25_sm1.jpg','img/details/md/f1_25_md1.jpg'),
    (NULL,2,25,'img/details/sm/f1_25_sm2.jpg','img/details/md/f1_25_md2.jpg'),
    (NULL,3,25,'img/details/sm/f1_25_sm3.jpg','img/details/md/f1_25_md3.jpg'),
    (NULL,4,25,'img/details/sm/f1_25_sm4.jpg','img/details/md/f1_25_md4.jpg'),
    (NULL,5,25,'img/details/sm/f1_25_sm5.jpg','img/details/md/f1_25_md5.jpg'),

    (NULL,1,26,'img/details/sm/f1_26_sm1.jpg','img/details/md/f1_26_md1.jpg'),
    (NULL,2,26,'img/details/sm/f1_26_sm2.jpg','img/details/md/f1_26_md2.jpg'),
    (NULL,3,26,'img/details/sm/f1_26_sm3.jpg','img/details/md/f1_26_md3.jpg'),
    (NULL,4,26,'img/details/sm/f1_26_sm4.jpg','img/details/md/f1_26_md4.jpg'),
    (NULL,5,26,'img/details/sm/f1_26_sm5.jpg','img/details/md/f1_26_md5.jpg'),

    (NULL,1,27,'img/details/sm/f1_27_sm1.jpg','img/details/md/f1_27_md1.jpg'),
    (NULL,2,27,'img/details/sm/f1_27_sm2.jpg','img/details/md/f1_27_md2.jpg'),
    (NULL,3,27,'img/details/sm/f1_27_sm3.jpg','img/details/md/f1_27_md3.jpg'),
    (NULL,4,27,'img/details/sm/f1_27_sm4.jpg','img/details/md/f1_27_md4.jpg'),
    (NULL,5,27,'img/details/sm/f1_27_sm5.jpg','img/details/md/f1_27_md5.jpg'),

    (NULL,1,28,'img/details/sm/f1_28_sm1.jpg','img/details/md/f1_28_md1.jpg'),
    (NULL,2,28,'img/details/sm/f1_28_sm2.jpg','img/details/md/f1_28_md2.jpg'),
    (NULL,3,28,'img/details/sm/f1_28_sm3.jpg','img/details/md/f1_28_md3.jpg'),
    (NULL,4,28,'img/details/sm/f1_28_sm4.jpg','img/details/md/f1_28_md4.jpg'),
    (NULL,5,28,'img/details/sm/f1_28_sm5.jpg','img/details/md/f1_28_md5.jpg'),

    (NULL,1,29,'img/details/sm/f1_29_sm1.jpg','img/details/md/f1_29_md1.jpg'),
    (NULL,2,29,'img/details/sm/f1_29_sm2.jpg','img/details/md/f1_29_md2.jpg'),
    (NULL,3,29,'img/details/sm/f1_29_sm3.jpg','img/details/md/f1_29_md3.jpg'),
    (NULL,4,29,'img/details/sm/f1_29_sm4.jpg','img/details/md/f1_29_md4.jpg'),

    (NULL,1,30,'img/details/sm/f1_30_sm1.jpg','img/details/md/f1_30_md1.jpg'),
    (NULL,2,30,'img/details/sm/f1_30_sm2.jpg','img/details/md/f1_30_md2.jpg'),
    (NULL,3,30,'img/details/sm/f1_30_sm3.jpg','img/details/md/f1_30_md3.jpg'),
    (NULL,4,30,'img/details/sm/f1_30_sm4.jpg','img/details/md/f1_30_md4.jpg'),
    (NULL,5,30,'img/details/sm/f1_30_sm5.jpg','img/details/md/f1_30_md5.jpg'),

    (NULL,1,31,'img/details/sm/f1_31_sm1.jpg','img/details/md/f1_31_md1.jpg'),
    (NULL,2,31,'img/details/sm/f1_31_sm2.jpg','img/details/md/f1_31_md2.jpg'),
    (NULL,3,31,'img/details/sm/f1_31_sm3.jpg','img/details/md/f1_31_md3.jpg'),
    (NULL,4,31,'img/details/sm/f1_31_sm4.jpg','img/details/md/f1_31_md4.jpg'),
    (NULL,5,31,'img/details/sm/f1_31_sm5.jpg','img/details/md/f1_31_md5.jpg'),

    (NULL,1,32,'img/details/sm/f1_32_sm1.jpg','img/details/md/f1_32_md1.jpg'),
    (NULL,2,32,'img/details/sm/f1_32_sm2.jpg','img/details/md/f1_32_md2.jpg'),
    (NULL,3,32,'img/details/sm/f1_32_sm3.jpg','img/details/md/f1_32_md3.jpg'),

/*2楼*/
    (NULL,1,33,'img/details/sm/f2_01_sm1.jpg','img/details/md/f2_01_md1.jpg'),
    (NULL,2,33,'img/details/sm/f2_01_sm2.jpg','img/details/md/f2_01_md2.jpg'),
    (NULL,3,33,'img/details/sm/f2_01_sm3.jpg','img/details/md/f2_01_md3.jpg'),
    (NULL,4,33,'img/details/sm/f2_01_sm4.jpg','img/details/md/f2_01_md4.jpg'),
    (NULL,5,33,'img/details/sm/f2_01_sm5.jpg','img/details/md/f2_01_md5.jpg'),

    (NULL,1,34,'img/details/sm/f2_02_sm1.jpg','img/details/md/f2_02_md1.jpg'),

    (NULL,1,35,'img/details/sm/f2_03_sm1.jpg','img/details/md/f2_03_md1.jpg'),
    (NULL,2,35,'img/details/sm/f2_03_sm2.jpg','img/details/md/f2_03_md2.jpg'),
    (NULL,3,35,'img/details/sm/f2_03_sm3.jpg','img/details/md/f2_03_md3.jpg'),
    (NULL,4,35,'img/details/sm/f2_03_sm4.jpg','img/details/md/f2_03_md4.jpg'),
    (NULL,5,35,'img/details/sm/f2_03_sm5.jpg','img/details/md/f2_03_md5.jpg'),

    (NULL,1,36,'img/details/sm/f2_04_sm1.jpg','img/details/md/f2_04_md1.jpg'),

    (NULL,1,37,'img/details/sm/f2_05_sm1.jpg','img/details/md/f2_05_md1.jpg'),
    (NULL,2,37,'img/details/sm/f2_05_sm2.jpg','img/details/md/f2_05_md2.jpg'),
    (NULL,3,37,'img/details/sm/f2_05_sm3.jpg','img/details/md/f2_05_md3.jpg'),
    (NULL,4,37,'img/details/sm/f2_05_sm4.jpg','img/details/md/f2_05_md4.jpg'),
    (NULL,5,37,'img/details/sm/f2_05_sm5.jpg','img/details/md/f2_05_md5.jpg'),

    (NULL,1,38,'img/details/sm/f2_06_sm1.jpg','img/details/md/f2_06_md1.jpg'),
    (NULL,2,38,'img/details/sm/f2_06_sm2.jpg','img/details/md/f2_06_md2.jpg'),

    (NULL,1,39,'img/details/sm/f2_07_sm1.jpg','img/details/md/f2_07_md1.jpg'),
    (NULL,2,39,'img/details/sm/f2_07_sm2.jpg','img/details/md/f2_07_md2.jpg'),

    (NULL,1,40,'img/details/sm/f2_08_sm1.jpg','img/details/md/f2_08_md1.jpg'),
    (NULL,2,40,'img/details/sm/f2_08_sm2.jpg','img/details/md/f2_08_md2.jpg'),
    (NULL,3,40,'img/details/sm/f2_08_sm3.jpg','img/details/md/f2_08_md3.jpg'),
    (NULL,4,40,'img/details/sm/f2_08_sm4.jpg','img/details/md/f2_08_md4.jpg'),

    (NULL,1,41,'img/details/sm/f2_09_sm1.jpg','img/details/md/f2_09_md1.jpg'),
    (NULL,2,41,'img/details/sm/f2_09_sm2.jpg','img/details/md/f2_09_md2.jpg'),
    (NULL,3,41,'img/details/sm/f2_09_sm3.jpg','img/details/md/f2_09_md3.jpg'),
    (NULL,4,41,'img/details/sm/f2_09_sm4.jpg','img/details/md/f2_09_md4.jpg'),
    (NULL,5,41,'img/details/sm/f2_09_sm5.jpg','img/details/md/f2_09_md5.jpg'),
    /*10*/
    (NULL,1,42,'img/details/sm/f2_10_sm1.jpg','img/details/md/f2_10_md1.jpg'),
    (NULL,2,42,'img/details/sm/f2_10_sm2.jpg','img/details/md/f2_10_md2.jpg'),
    (NULL,3,42,'img/details/sm/f2_10_sm3.jpg','img/details/md/f2_10_md3.jpg'),
    (NULL,4,42,'img/details/sm/f2_10_sm4.jpg','img/details/md/f2_10_md4.jpg'),
    (NULL,5,42,'img/details/sm/f2_10_sm5.jpg','img/details/md/f2_10_md5.jpg'),


    (NULL,1,43,'img/details/sm/f2_11_sm1.jpg','img/details/md/f2_11_md1.jpg'),
    (NULL,2,43,'img/details/sm/f2_11_sm2.jpg','img/details/md/f2_11_md2.jpg'),
    (NULL,3,43,'img/details/sm/f2_11_sm3.jpg','img/details/md/f2_11_md3.jpg'),
    (NULL,4,43,'img/details/sm/f2_11_sm4.jpg','img/details/md/f2_11_md4.jpg'),
    (NULL,5,43,'img/details/sm/f2_11_sm5.jpg','img/details/md/f2_11_md5.jpg'),

    (NULL,1,44,'img/details/sm/f2_12_sm1.jpg','img/details/md/f2_12_md1.jpg'),
    (NULL,2,44,'img/details/sm/f2_12_sm2.jpg','img/details/md/f2_12_md2.jpg'),
    (NULL,3,44,'img/details/sm/f2_12_sm3.jpg','img/details/md/f2_12_md3.jpg'),
    (NULL,4,44,'img/details/sm/f2_12_sm4.jpg','img/details/md/f2_12_md4.jpg'),
    (NULL,5,44,'img/details/sm/f2_12_sm5.jpg','img/details/md/f2_12_md5.jpg'),

    (NULL,1,45,'img/details/sm/f2_13_sm1.jpg','img/details/md/f2_13_md1.jpg'),
    (NULL,2,45,'img/details/sm/f2_13_sm2.jpg','img/details/md/f2_13_md2.jpg'),
    (NULL,3,45,'img/details/sm/f2_13_sm3.jpg','img/details/md/f2_13_md3.jpg'),
    (NULL,4,45,'img/details/sm/f2_13_sm4.jpg','img/details/md/f2_13_md4.jpg'),
    (NULL,5,45,'img/details/sm/f2_13_sm5.jpg','img/details/md/f2_13_md5.jpg'),

    (NULL,1,46,'img/details/sm/f2_14_sm1.jpg','img/details/md/f2_14_md1.jpg'),
    (NULL,2,46,'img/details/sm/f2_14_sm2.jpg','img/details/md/f2_14_md2.jpg'),
    (NULL,3,46,'img/details/sm/f2_14_sm3.jpg','img/details/md/f2_14_md3.jpg'),
    (NULL,4,46,'img/details/sm/f2_14_sm4.jpg','img/details/md/f2_14_md4.jpg'),
    (NULL,5,46,'img/details/sm/f2_14_sm5.jpg','img/details/md/f2_14_md5.jpg'),

    (NULL,1,47,'img/details/sm/f2_15_sm1.jpg','img/details/md/f2_15_md1.jpg'),
    (NULL,2,47,'img/details/sm/f2_15_sm2.jpg','img/details/md/f2_15_md2.jpg'),
    (NULL,3,47,'img/details/sm/f2_15_sm3.jpg','img/details/md/f2_15_md3.jpg'),
    (NULL,4,47,'img/details/sm/f2_15_sm4.jpg','img/details/md/f2_15_md4.jpg'),
    (NULL,5,47,'img/details/sm/f2_15_sm5.jpg','img/details/md/f2_15_md5.jpg'),

    (NULL,1,48,'img/details/sm/f2_16_sm1.jpg','img/details/md/f2_16_md1.jpg'),
    (NULL,2,48,'img/details/sm/f2_16_sm2.jpg','img/details/md/f2_16_md2.jpg'),
    (NULL,3,48,'img/details/sm/f2_16_sm3.jpg','img/details/md/f2_16_md3.jpg'),
    (NULL,4,48,'img/details/sm/f2_16_sm4.jpg','img/details/md/f2_16_md4.jpg'),
    (NULL,5,48,'img/details/sm/f2_16_sm5.jpg','img/details/md/f2_16_md5.jpg'),
/*3楼*/
    (NULL,1,49,'img/details/sm/f3_01_sm1.jpg','img/details/md/f3_01_md1.jpg'),
    (NULL,2,49,'img/details/sm/f3_01_sm2.jpg','img/details/md/f3_01_md2.jpg'),
    (NULL,3,49,'img/details/sm/f3_01_sm3.jpg','img/details/md/f3_01_md3.jpg'),
    (NULL,4,49,'img/details/sm/f3_01_sm4.jpg','img/details/md/f3_01_md4.jpg'),
    (NULL,5,49,'img/details/sm/f3_01_sm5.jpg','img/details/md/f3_01_md5.jpg'),

    (NULL,1,50,'img/details/sm/f3_02_sm1.jpg','img/details/md/f3_02_md1.jpg'),
    (NULL,2,50,'img/details/sm/f3_02_sm2.jpg','img/details/md/f3_02_md2.jpg'),
    (NULL,3,50,'img/details/sm/f3_02_sm3.jpg','img/details/md/f3_02_md3.jpg'),
    (NULL,4,50,'img/details/sm/f3_02_sm4.jpg','img/details/md/f3_02_md4.jpg'),
    (NULL,5,50,'img/details/sm/f3_02_sm5.jpg','img/details/md/f3_02_md5.jpg'),

    (NULL,1,51,'img/details/sm/f3_03_sm1.jpg','img/details/md/f3_03_md1.jpg'),
    (NULL,2,51,'img/details/sm/f3_03_sm2.jpg','img/details/md/f3_03_md2.jpg'),
    (NULL,3,51,'img/details/sm/f3_03_sm3.jpg','img/details/md/f3_03_md3.jpg'),
    (NULL,4,51,'img/details/sm/f3_03_sm4.jpg','img/details/md/f3_03_md4.jpg'),
    (NULL,5,51,'img/details/sm/f3_03_sm5.jpg','img/details/md/f3_03_md5.jpg'),

    (NULL,1,52,'img/details/sm/f3_04_sm1.jpg','img/details/md/f3_04_md1.jpg'),
    (NULL,2,52,'img/details/sm/f3_04_sm2.jpg','img/details/md/f3_04_md2.jpg'),
    (NULL,3,52,'img/details/sm/f3_04_sm3.jpg','img/details/md/f3_04_md3.jpg'),
    (NULL,4,52,'img/details/sm/f3_04_sm4.jpg','img/details/md/f3_04_md4.jpg'),
    (NULL,5,52,'img/details/sm/f3_04_sm5.jpg','img/details/md/f3_04_md5.jpg'),

    (NULL,1,53,'img/details/sm/f3_05_sm1.jpg','img/details/md/f3_05_md1.jpg'),
    (NULL,2,53,'img/details/sm/f3_05_sm2.jpg','img/details/md/f3_05_md2.jpg'),
    (NULL,3,53,'img/details/sm/f3_05_sm3.jpg','img/details/md/f3_05_md3.jpg'),
    (NULL,4,53,'img/details/sm/f3_05_sm4.jpg','img/details/md/f3_05_md4.jpg'),
    (NULL,5,53,'img/details/sm/f3_05_sm5.jpg','img/details/md/f3_05_md5.jpg'),

    (NULL,1,54,'img/details/sm/f3_06_sm1.jpg','img/details/md/f3_06_md1.jpg'),
    (NULL,2,54,'img/details/sm/f3_06_sm2.jpg','img/details/md/f3_06_md2.jpg'),
    (NULL,3,54,'img/details/sm/f3_06_sm3.jpg','img/details/md/f3_06_md3.jpg'),
    (NULL,4,54,'img/details/sm/f3_06_sm4.jpg','img/details/md/f3_06_md4.jpg'),
    (NULL,5,54,'img/details/sm/f3_06_sm5.jpg','img/details/md/f3_06_md5.jpg'),

    (NULL,1,55,'img/details/sm/f3_07_sm1.jpg','img/details/md/f3_07_md1.jpg'),
    (NULL,2,55,'img/details/sm/f3_07_sm2.jpg','img/details/md/f3_07_md2.jpg'),
    (NULL,3,55,'img/details/sm/f3_07_sm3.jpg','img/details/md/f3_07_md3.jpg'),
    (NULL,4,55,'img/details/sm/f3_07_sm4.jpg','img/details/md/f3_07_md4.jpg'),
    (NULL,5,55,'img/details/sm/f3_07_sm5.jpg','img/details/md/f3_07_md5.jpg'),
/*8*/

    (NULL,1,56,'img/details/sm/f3_08_sm1.jpg','img/details/md/f3_08_md1.jpg'),
    (NULL,2,56,'img/details/sm/f3_08_sm2.jpg','img/details/md/f3_08_md2.jpg'),
    (NULL,3,56,'img/details/sm/f3_08_sm3.jpg','img/details/md/f3_08_md3.jpg'),
    (NULL,4,56,'img/details/sm/f3_08_sm4.jpg','img/details/md/f3_08_md4.jpg'),

    (NULL,1,57,'img/details/sm/f3_09_sm1.jpg','img/details/md/f3_09_md1.jpg'),
    (NULL,2,57,'img/details/sm/f3_09_sm2.jpg','img/details/md/f3_09_md2.jpg'),
    (NULL,3,57,'img/details/sm/f3_09_sm3.jpg','img/details/md/f3_09_md3.jpg'),
    (NULL,4,57,'img/details/sm/f3_09_sm4.jpg','img/details/md/f3_09_md4.jpg'),
    (NULL,5,57,'img/details/sm/f3_09_sm5.jpg','img/details/md/f3_09_md5.jpg'),

    (NULL,1,58,'img/details/sm/f3_10_sm1.jpg','img/details/md/f3_10_md1.jpg'),
    (NULL,2,58,'img/details/sm/f3_10_sm2.jpg','img/details/md/f3_10_md1.jpg'),
    (NULL,3,58,'img/details/sm/f3_10_sm3.jpg','img/details/md/f3_10_md1.jpg'),
    (NULL,4,58,'img/details/sm/f3_10_sm4.jpg','img/details/md/f3_10_md1.jpg'),
    (NULL,5,58,'img/details/sm/f3_10_sm5.jpg','img/details/md/f3_10_md1.jpg'),

    (NULL,1,59,'img/details/sm/f3_11_sm1.jpg','img/details/md/f3_11_md1.jpg'),
    (NULL,2,59,'img/details/sm/f3_11_sm2.jpg','img/details/md/f3_11_md2.jpg'),
    (NULL,3,59,'img/details/sm/f3_11_sm3.jpg','img/details/md/f3_11_md3.jpg'),
    (NULL,4,59,'img/details/sm/f3_11_sm4.jpg','img/details/md/f3_11_md4.jpg'),
    (NULL,5,59,'img/details/sm/f3_11_sm5.jpg','img/details/md/f3_11_md5.jpg'),

    (NULL,1,60,'img/details/sm/f3_12_sm1.jpg','img/details/md/f3_12_md1.jpg'),
    (NULL,2,60,'img/details/sm/f3_12_sm2.jpg','img/details/md/f3_12_md2.jpg'),
    (NULL,3,60,'img/details/sm/f3_12_sm3.jpg','img/details/md/f3_12_md3.jpg'),
    (NULL,4,60,'img/details/sm/f3_12_sm4.jpg','img/details/md/f3_12_md4.jpg'),
    (NULL,5,60,'img/details/sm/f3_12_sm5.jpg','img/details/md/f3_12_md5.jpg'),

    (NULL,1,61,'img/details/sm/f3_13_sm1.jpg','img/details/md/f3_13_md1.jpg'),
    (NULL,2,61,'img/details/sm/f3_13_sm2.jpg','img/details/md/f3_13_md2.jpg'),
    (NULL,3,61,'img/details/sm/f3_13_sm3.jpg','img/details/md/f3_13_md3.jpg'),
    (NULL,4,61,'img/details/sm/f3_13_sm4.jpg','img/details/md/f3_13_md4.jpg'),
    (NULL,5,61,'img/details/sm/f3_13_sm5.jpg','img/details/md/f3_13_md5.jpg'),

    (NULL,1,62,'img/details/sm/f3_14_sm1.jpg','img/details/md/f3_14_md1.jpg'),
    (NULL,2,62,'img/details/sm/f3_14_sm2.jpg','img/details/md/f3_14_md2.jpg'),
    (NULL,3,62,'img/details/sm/f3_14_sm3.jpg','img/details/md/f3_14_md3.jpg'),
    (NULL,4,62,'img/details/sm/f3_14_sm4.jpg','img/details/md/f3_14_md4.jpg'),
    (NULL,5,62,'img/details/sm/f3_14_sm5.jpg','img/details/md/f3_14_md5.jpg'),
/*15*/
    (NULL,1,63,'img/details/sm/f3_15_sm1.jpg','img/details/md/f3_15_md1.jpg'),

    (NULL,1,64,'img/details/sm/f3_16_sm1.jpg','img/details/md/f3_16_md1.jpg'),
    (NULL,2,64,'img/details/sm/f3_16_sm2.jpg','img/details/md/f3_16_md2.jpg'),
    (NULL,3,64,'img/details/sm/f3_16_sm3.jpg','img/details/md/f3_16_md3.jpg'),
    (NULL,4,64,'img/details/sm/f3_16_sm4.jpg','img/details/md/f3_16_md4.jpg'),
    (NULL,5,64,'img/details/sm/f3_16_sm5.jpg','img/details/md/f3_16_md5.jpg'),

    (NULL,1,65,'img/details/sm/f3_17_sm1.jpg','img/details/md/f3_17_md1.jpg'),
    (NULL,2,65,'img/details/sm/f3_17_sm1.jpg','img/details/md/f3_17_md1.jpg'),
    (NULL,3,65,'img/details/sm/f3_17_sm1.jpg','img/details/md/f3_17_md1.jpg'),

    (NULL,1,66,'img/details/sm/f3_18_sm1.jpg','img/details/md/f3_18_md1.jpg'),
    (NULL,2,66,'img/details/sm/f3_18_sm2.jpg','img/details/md/f3_18_md2.jpg'),
    (NULL,3,66,'img/details/sm/f3_18_sm3.jpg','img/details/md/f3_18_md3.jpg'),
 
    (NULL,1,67,'img/details/sm/f3_19_sm1.jpg','img/details/md/f3_19_md1.jpg'),
    (NULL,2,67,'img/details/sm/f3_19_sm2.jpg','img/details/md/f3_19_md2.jpg'),

    (NULL,1,68,'img/details/sm/f3_20_sm1.jpg','img/details/md/f3_20_md1.jpg'),
    (NULL,2,68,'img/details/sm/f3_20_sm2.jpg','img/details/md/f3_20_md2.jpg'),
    (NULL,3,68,'img/details/sm/f3_20_sm3.jpg','img/details/md/f3_20_md3.jpg'),
    (NULL,4,68,'img/details/sm/f3_20_sm4.jpg','img/details/md/f3_20_md4.jpg'),
    (NULL,5,68,'img/details/sm/f3_20_sm5.jpg','img/details/md/f3_20_md5.jpg'),

/*21*/
    (NULL,1,69,'img/details/sm/f3_21_sm1.jpg','img/details/md/f3_21_md1.jpg'),
    (NULL,2,69,'img/details/sm/f3_21_sm2.jpg','img/details/md/f3_21_md2.jpg'),
    (NULL,3,69,'img/details/sm/f3_21_sm3.jpg','img/details/md/f3_21_md3.jpg'),
    (NULL,4,69,'img/details/sm/f3_21_sm4.jpg','img/details/md/f3_21_md4.jpg'),
    (NULL,5,69,'img/details/sm/f3_21_sm5.jpg','img/details/md/f3_21_md5.jpg'),

    (NULL,1,70,'img/details/sm/f3_22_sm1.jpg','img/details/md/f3_22_md1.jpg'),
    (NULL,2,70,'img/details/sm/f3_22_sm2.jpg','img/details/md/f3_22_md2.jpg'),
    (NULL,3,70,'img/details/sm/f3_22_sm3.jpg','img/details/md/f3_22_md3.jpg'),
    (NULL,4,70,'img/details/sm/f3_22_sm4.jpg','img/details/md/f3_22_md4.jpg'),
    (NULL,5,70,'img/details/sm/f3_22_sm5.jpg','img/details/md/f3_22_md5.jpg'),

    (NULL,1,71,'img/details/sm/f3_23_sm1.jpg','img/details/md/f3_23_md1.jpg'),
    (NULL,2,71,'img/details/sm/f3_23_sm2.jpg','img/details/md/f3_23_md2.jpg'),
    (NULL,3,71,'img/details/sm/f3_23_sm3.jpg','img/details/md/f3_23_md3.jpg'),
    (NULL,4,71,'img/details/sm/f3_23_sm4.jpg','img/details/md/f3_23_md4.jpg'),
    (NULL,5,71,'img/details/sm/f3_23_sm5.jpg','img/details/md/f3_23_md5.jpg'),

    (NULL,1,72,'img/details/sm/f3_24_sm1.jpg','img/details/md/f3_24_md1.jpg'),
    (NULL,2,72,'img/details/sm/f3_24_sm2.jpg','img/details/md/f3_24_md2.jpg'),
    (NULL,3,72,'img/details/sm/f3_24_sm3.jpg','img/details/md/f3_24_md3.jpg'),
    (NULL,4,72,'img/details/sm/f3_24_sm4.jpg','img/details/md/f3_24_md4.jpg'),
    (NULL,5,72,'img/details/sm/f3_24_sm5.jpg','img/details/md/f3_24_md5.jpg'),

/*4楼*/
    (NULL,1,73,'img/details/sm/f4_01_sm1.jpg','img/details/md/f4_01_md1.jpg'),
    (NULL,2,73,'img/details/sm/f4_01_sm2.jpg','img/details/md/f4_01_md2.jpg'),
    (NULL,3,73,'img/details/sm/f4_01_sm3.jpg','img/details/md/f4_01_md3.jpg'),
    (NULL,4,73,'img/details/sm/f4_01_sm4.jpg','img/details/md/f4_01_md4.jpg'),

    (NULL,1,74,'img/details/sm/f4_02_sm1.jpg','img/details/md/f4_02_md1.jpg'),
    (NULL,2,74,'img/details/sm/f4_02_sm2.jpg','img/details/md/f4_02_md2.jpg'),
    (NULL,3,74,'img/details/sm/f4_02_sm3.jpg','img/details/md/f4_02_md3.jpg'),

    (NULL,1,75,'img/details/sm/f4_03_sm1.jpg','img/details/md/f4_03_md1.jpg'),
    (NULL,2,75,'img/details/sm/f4_03_sm2.jpg','img/details/md/f4_03_md2.jpg'),
    (NULL,3,75,'img/details/sm/f4_03_sm3.jpg','img/details/md/f4_03_md3.jpg'),
    (NULL,4,75,'img/details/sm/f4_03_sm4.jpg','img/details/md/f4_03_md4.jpg'),
    (NULL,5,75,'img/details/sm/f4_03_sm5.jpg','img/details/md/f4_03_md5.jpg'),

    (NULL,1,76,'img/details/sm/f4_04_sm1.jpg','img/details/md/f4_04_md1.jpg'),
    (NULL,2,76,'img/details/sm/f4_04_sm2.jpg','img/details/md/f4_04_md2.jpg'),
    (NULL,3,76,'img/details/sm/f4_04_sm3.jpg','img/details/md/f4_04_md3.jpg'),
    (NULL,4,76,'img/details/sm/f4_04_sm4.jpg','img/details/md/f4_04_md4.jpg'),

    (NULL,1,77,'img/details/sm/f4_05_sm1.jpg','img/details/md/f4_05_md1.jpg'),
    (NULL,2,77,'img/details/sm/f4_05_sm2.jpg','img/details/md/f4_05_md2.jpg'),
    (NULL,3,77,'img/details/sm/f4_05_sm3.jpg','img/details/md/f4_05_md3.jpg'),
    (NULL,4,77,'img/details/sm/f4_05_sm4.jpg','img/details/md/f4_05_md4.jpg'),
    (NULL,5,77,'img/details/sm/f4_05_sm5.jpg','img/details/md/f4_05_md5.jpg'),
/*6*/
    (NULL,1,78,'img/details/sm/f4_06_sm1.jpg','img/details/md/f4_06_md1.jpg'),
    (NULL,2,78,'img/details/sm/f4_06_sm2.jpg','img/details/md/f4_06_md2.jpg'),
    (NULL,3,78,'img/details/sm/f4_06_sm3.jpg','img/details/md/f4_06_md3.jpg'),
    (NULL,4,78,'img/details/sm/f4_06_sm4.jpg','img/details/md/f4_06_md4.jpg'),
    (NULL,5,78,'img/details/sm/f4_06_sm5.jpg','img/details/md/f4_06_md5.jpg'),

    (NULL,1,79,'img/details/sm/f4_07_sm1.jpg','img/details/md/f4_07_md1.jpg'),
    (NULL,2,79,'img/details/sm/f4_07_sm2.jpg','img/details/md/f4_07_md2.jpg'),
    (NULL,3,79,'img/details/sm/f4_07_sm3.jpg','img/details/md/f4_07_md3.jpg'),
    (NULL,4,79,'img/details/sm/f4_07_sm4.jpg','img/details/md/f4_07_md4.jpg'),
    (NULL,5,79,'img/details/sm/f4_07_sm5.jpg','img/details/md/f4_07_md5.jpg'),

    (NULL,1,80,'img/details/sm/f4_08_sm1.jpg','img/details/md/f4_08_md1.jpg'),
    (NULL,2,80,'img/details/sm/f4_08_sm2.jpg','img/details/md/f4_08_md2.jpg'),
    (NULL,3,80,'img/details/sm/f4_08_sm3.jpg','img/details/md/f4_08_md3.jpg'),
    (NULL,4,80,'img/details/sm/f4_08_sm4.jpg','img/details/md/f4_08_md4.jpg'),
    (NULL,5,80,'img/details/sm/f4_08_sm5.jpg','img/details/md/f4_08_md5.jpg'),

    (NULL,1,81,'img/details/sm/f4_09_sm1.jpg','img/details/md/f4_09_md1.jpg'),
    (NULL,2,81,'img/details/sm/f4_09_sm2.jpg','img/details/md/f4_09_md2.jpg'),
    (NULL,3,81,'img/details/sm/f4_09_sm3.jpg','img/details/md/f4_09_md3.jpg'),
    (NULL,4,81,'img/details/sm/f4_09_sm4.jpg','img/details/md/f4_09_md4.jpg'),
    (NULL,5,81,'img/details/sm/f4_09_sm5.jpg','img/details/md/f4_09_md5.jpg'),

    (NULL,1,82,'img/details/sm/f4_10_sm1.jpg','img/details/md/f4_10_md1.jpg'),
    (NULL,2,82,'img/details/sm/f4_10_sm2.jpg','img/details/md/f4_10_md2.jpg'),
    (NULL,3,82,'img/details/sm/f4_10_sm3.jpg','img/details/md/f4_10_md3.jpg'),
    (NULL,4,82,'img/details/sm/f4_10_sm4.jpg','img/details/md/f4_10_md4.jpg'),
    (NULL,5,82,'img/details/sm/f4_10_sm5.jpg','img/details/md/f4_10_md5.jpg'),

    (NULL,1,83,'img/details/sm/f4_11_sm1.jpg','img/details/md/f4_11_md1.jpg'),
    (NULL,2,83,'img/details/sm/f4_11_sm2.jpg','img/details/md/f4_11_md2.jpg'),
    (NULL,3,83,'img/details/sm/f4_11_sm3.jpg','img/details/md/f4_11_md3.jpg'),
    (NULL,4,83,'img/details/sm/f4_11_sm4.jpg','img/details/md/f4_11_md4.jpg'),
    (NULL,5,83,'img/details/sm/f4_11_sm5.jpg','img/details/md/f4_11_md5.jpg'),
    /*12*/
    (NULL,1,84,'img/details/sm/f4_12_sm1.jpg','img/details/md/f4_12_md1.jpg'),
    (NULL,2,84,'img/details/sm/f4_12_sm2.jpg','img/details/md/f4_12_md2.jpg'),

    (NULL,1,85,'img/details/sm/f4_13_sm1.jpg','img/details/md/f4_13_md1.jpg'),

    (NULL,1,86,'img/details/sm/f4_14_sm1.jpg','img/details/md/f4_14_md1.jpg'),
    (NULL,2,86,'img/details/sm/f4_14_sm2.jpg','img/details/md/f4_14_md2.jpg'),
    (NULL,3,86,'img/details/sm/f4_14_sm3.jpg','img/details/md/f4_14_md3.jpg'),
    (NULL,4,86,'img/details/sm/f4_14_sm4.jpg','img/details/md/f4_14_md4.jpg'),
    (NULL,5,86,'img/details/sm/f4_14_sm5.jpg','img/details/md/f4_14_md5.jpg'),

    (NULL,1,87,'img/details/sm/f4_15_sm1.jpg','img/details/md/f4_15_md1.jpg'),
    (NULL,2,87,'img/details/sm/f4_15_sm2.jpg','img/details/md/f4_15_md2.jpg'),
    (NULL,3,87,'img/details/sm/f4_15_sm3.jpg','img/details/md/f4_15_md3.jpg'),
    (NULL,4,87,'img/details/sm/f4_15_sm4.jpg','img/details/md/f4_15_md4.jpg'),
    (NULL,5,87,'img/details/sm/f4_15_sm5.jpg','img/details/md/f4_15_md5.jpg'),
/*5楼*/
    (NULL,1,88,'img/details/sm/f5_01_sm1.jpg','img/details/md/f5_01_md1.jpg'),
    (NULL,2,88,'img/details/sm/f5_01_sm1.jpg','img/details/md/f5_01_md2.jpg'),

    (NULL,1,89,'img/details/sm/f5_02_sm1.jpg','img/details/md/f5_02_md1.jpg'),
    (NULL,2,89,'img/details/sm/f5_02_sm2.jpg','img/details/md/f5_02_md2.jpg'),
    (NULL,3,89,'img/details/sm/f5_02_sm3.jpg','img/details/md/f5_02_md3.jpg'),

    (NULL,1,90,'img/details/sm/f5_03_sm1.jpg','img/details/md/f5_03_md1.jpg'),
    (NULL,2,90,'img/details/sm/f5_03_sm2.jpg','img/details/md/f5_03_md2.jpg'),
    (NULL,3,90,'img/details/sm/f5_03_sm3.jpg','img/details/md/f5_03_md3.jpg'),
    (NULL,4,90,'img/details/sm/f5_03_sm4.jpg','img/details/md/f5_03_md4.jpg'),
    (NULL,5,90,'img/details/sm/f5_03_sm5.jpg','img/details/md/f5_03_md5.jpg'),

    (NULL,1,91,'img/details/sm/f5_04_sm1.jpg','img/details/md/f5_04_md1.jpg'),
    (NULL,2,91,'img/details/sm/f5_04_sm2.jpg','img/details/md/f5_04_md2.jpg'),
    (NULL,3,91,'img/details/sm/f5_04_sm3.jpg','img/details/md/f5_04_md3.jpg'),
    (NULL,4,91,'img/details/sm/f5_04_sm4.jpg','img/details/md/f5_04_md4.jpg'),
    (NULL,5,91,'img/details/sm/f5_04_sm5.jpg','img/details/md/f5_04_md5.jpg'),

    (NULL,1,92,'img/details/sm/f5_05_sm1.jpg','img/details/md/f5_05_md1.jpg'),
    (NULL,2,92,'img/details/sm/f5_05_sm2.jpg','img/details/md/f5_05_md2.jpg'),
    (NULL,3,92,'img/details/sm/f5_05_sm3.jpg','img/details/md/f5_05_md3.jpg'),
    (NULL,4,92,'img/details/sm/f5_05_sm4.jpg','img/details/md/f5_05_md4.jpg'),
    (NULL,5,92,'img/details/sm/f5_05_sm5.jpg','img/details/md/f5_05_md5.jpg'),

    (NULL,1,93,'img/details/sm/f5_06_sm1.jpg','img/details/md/f5_06_md1.jpg'),
    (NULL,2,93,'img/details/sm/f5_06_sm2.jpg','img/details/md/f5_06_md2.jpg'),
    (NULL,3,93,'img/details/sm/f5_06_sm3.jpg','img/details/md/f5_06_md3.jpg'),
    (NULL,4,93,'img/details/sm/f5_06_sm4.jpg','img/details/md/f5_06_md4.jpg'),
    (NULL,5,93,'img/details/sm/f5_06_sm5.jpg','img/details/md/f5_06_md5.jpg'),

    (NULL,1,94,'img/details/sm/f5_07_sm1.jpg','img/details/md/f5_07_md1.jpg'),
    (NULL,2,94,'img/details/sm/f5_07_sm2.jpg','img/details/md/f5_07_md2.jpg'),
    (NULL,3,94,'img/details/sm/f5_07_sm3.jpg','img/details/md/f5_07_md3.jpg'),
    (NULL,4,94,'img/details/sm/f5_07_sm4.jpg','img/details/md/f5_07_md4.jpg'),
    (NULL,5,94,'img/details/sm/f5_07_sm5.jpg','img/details/md/f5_07_md5.jpg'),

    (NULL,1,95,'img/details/sm/f5_08_sm1.jpg','img/details/md/f5_08_md1.jpg'),
    (NULL,2,95,'img/details/sm/f5_08_sm2.jpg','img/details/md/f5_08_md2.jpg'),
    (NULL,3,95,'img/details/sm/f5_08_sm3.jpg','img/details/md/f5_08_md3.jpg');

/**用户信息**/
CREATE TABLE lsw_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16)
);

/**用户信息--插入数据**/
INSERT INTO lsw_user VALUES
(NULL, 'lala', '123456', 'la@qq.com', '13563259862'),
(NULL, 'jing', '123456', 'jing@qq.com', '13256982146'),
(NULL, 'ran', '123456', 'ran@qq.com', '13654692145'),
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560');

/**购物车条目**/
CREATE TABLE lsw_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,
  title VARCHAR(128),
  href VARCHAR(32),
  pic VARCHAR(32),
  price INT,
  count INT,
  jifen INT
);
/**购物车--插入数据**/
INSERT INTO lsw_cart VALUES
    (NULL,43,'母亲牛肉棒原味22g','details.html?lid=43','img/sm/2f_2.3.jpg',5.50, 1,5),
    (NULL,25,'格力高百力滋蓝莓芝士味45g', 'details.html?lid=25','img/sm/1f_4.1.jpg',4.00,1,4),
    (NULL,74,'溜梅梅大大黄梅400g', 'details.html?lid=74','img/sm/4f_1.2.jpg',30.00,2,60),
    (NULL,95,'TOMS蜂蜜黄油扁桃仁35g','details.html?lid=95','img/sm/5f_1.8.jpg',5.50,1,5),
    (NULL,88,'淘豆原味豌豆*100g 约4袋', 'details.html?lid=88','img/sm/5f_1.1.jpg',3.50,4,12),
    (NULL,2,'丽能压缩饼干葱油味*500g', 'details.html?lid=2','img/sm/1f_1.2.jpg',19.80,2,38);




