SET NAMES UTF8;
DROP DATABASE IF EXISTS lsw;
CREATE DATABASE lsw CHARSET=UTF8;
USE lsw;
#首页轮播图
CREATE TABLE shop_index_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(64),
    title VARCHAR(128),
    href VARCHAR(32)
);
#轮播图---插入数据
INSERT INTO shop_index_carousel  VALUES
        (NULL,'img/index/carousel/banner_1.jpg','首页轮播1','details.html?cid='),
        (NULL,'img/index/carousel/banner_2.jpg','首页轮播2','details.html?cid='),
        (NULL,'img/index/carousel/banner_3.jpg','首页轮播3','details.html?cid='),
        (NULL,'img/index/carousel/banner_4.jpg','首页轮播4','details.html?cid=');

#每日秒杀
CREATE TABLE shop_index_miaosha(
    mid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(32),
    title VARCHAR(32),
    subtitle VARCHAR(32),
    price INT,
    href VARCHAR(32)
);
#每日秒杀---插入数据
INSERT INTO shop_index_miaosha VALUES
    (NULL,'img/sm/5f_1.8.jpg','TOMS蜂蜜黄油扁桃仁35g','TOMS蜂蜜黄油扁桃仁35g',5.00,'details.html?lid=95'),
    (NULL,'img/sm/5f_1.1.jpg','淘豆原味豌豆*100g 约4袋','淘豆原味豌豆*100g 约4袋',3.50,'details.html?lid=88'),
    (NULL,'img/sm/3f_3.7.jpg','巧妈妈奇异果果汁果冻果蜜味125g','巧妈妈奇异果果汁果冻果蜜味125g',4.00,'details.html?lid=71'),
    (NULL,'img/sm/3f_2.2.jpg','润谷筒装果汁软糖杂果味75g','润谷筒装果汁软糖杂果味75g',5.50,'details.html?lid=58'),
    (NULL,'img/sm/2f_2.3.jpg','母亲牛肉棒原味22g','母亲牛肉棒原味22g',5.50,'details.html?lid=43'),
    (NULL,'img/sm/2f_1.8.jpg','啃馋你辣霸天下酱烤辣味鸭掌46g','啃馋你辣霸天下酱烤辣味鸭掌46g',3.80,'details.html?lid=40'),
    (NULL,'img/sm/1f_4.1.jpg','格力高百力滋蓝莓芝士味45g','格力高百力滋蓝莓芝士味45g',4.00,'details.html?lid=25'),
    (NULL,'img/sm/1f_1.3.jpg','掌柜达人原味小麻花*200g 约25袋','掌柜达人原味小麻花*200g 约25袋',6.50,'details.html?lid=3');

#热卖推荐
CREATE TABLE shop_index_hot(
    hid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(32),
    title VARCHAR(32),
    subtitle VARCHAR(32),
    price INT,
    href VARCHAR(32)
);
#热卖推荐---插入数据
INSERT INTO shop_index_hot VALUES
    (NULL,'img/sm/5f_1.5.jpg','甘源酱汁蚕豆牛肉味*500g 约35小包','甘源酱汁蚕豆牛肉味*500g 约35小包',16.50,'details.html?lid=92'),
    (NULL,'img/sm/4f_2.1.jpg','雪海梅乡盐津葡萄220g','雪海梅乡盐津葡萄220g',9.90,'details.html?lid=81'),
    (NULL,'img/sm/4f_1.1.jpg','零度深林零度杨梅原味*275g 约7个','零度深林零度杨梅原味*275g 约7个',13.80,'details.html?lid=73'),
    (NULL,'img/sm/3f_3.2.jpg','盛香珍芒果布丁330g','盛香珍芒果布丁330g',11.00,'details.html?lid=66'),
    (NULL,'img/sm/3f_1.4.jpg','不二家香醇牛奶硬质奶糖原味 40g','不二家香醇牛奶硬质奶糖原味 40g',9.80,'details.html?lid=52'),
    (NULL,'img/sm/2f_1.3.jpg','骥洋小鸡腿*500g 约17小包','骥洋小鸡腿*500g 约17小包',32.80,'details.html?lid=35'),
    (NULL,'img/sm/1f_3.5.jpg','丽芝士纳宝帝奶酪威化饼干350g','丽芝士纳宝帝奶酪威化饼干350g',23.80,'details.html?lid=21'),
    (NULL,'img/sm/4f_1.4.jpg','果然萌秋葵脆58g','果然萌秋葵脆58g',15.50,'details.html?lid=76');

#楼层导航数据表
CREATE TABLE shop_index_family(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32)
);
#楼层导航--插入数据
INSERT INTO shop_index_family VALUES
    (NULL,'饼干糕点'),
    (NULL,'肉类制品'),
    (NULL,'糖果巧克力'),
    (NULL,'蜜饯果干'),
    (NULL,'坚果炒货');

#创建楼层内容表
CREATE TABLE shop_index_product(
	  pid INT PRIMARY KEY AUTO_INCREMENT,
	  fid INT,
	  title VARCHAR(32),
	  subtitle VARCHAR(32),
	  prices INT,
	  imgs VARCHAR(32),
	  hrefs VARCHAR(32)
);
#楼层内容--插入数据
INSERT INTO shop_index_product VALUES
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
    (NULL,4,'雪海梅乡法式樱桃200g','雪海梅乡法式樱桃200g',9.90,'img/sm/4f_3.5.jpg','details.html?lid=85'),
    (NULL,4,'雪海梅乡冰花杨梅210g','雪海梅乡冰花杨梅210g',9.90,'img/sm/4f_3.6.jpg','details.html?lid=86'),
    (NULL,4,'三味轩日式去核梅蜂蜜味60g','三味轩日式去核梅蜂蜜味60g',5.50,'img/sm/4f_3.7.jpg','details.html?lid=87'),


    (NULL,5,'淘豆原味豌豆*100g 约4袋','淘豆原味豌豆*100g 约4袋',3.50,'img/sm/5f_1.1.jpg','details.html?lid=88'),
    (NULL,5,'芳草美仁盐焗南瓜子*250g 约11袋','芳草美仁盐焗南瓜子*250g 约11袋',9.80,'img/sm/5f_1.2.jpg','details.html?lid=89'),
    (NULL,5,'佳栗福甘栗开口栗180g','佳栗福甘栗开口栗180g',12.00,'img/sm/5f_1.3.jpg','details.html?lid=90'),
    (NULL,5,'爱咪咪鱼皮花生*500g 约11小袋','爱咪咪鱼皮花生*500g 约11小袋',12.00,'img/sm/5f_1.4.jpg','details.html?lid=91'),
    (NULL,5,'甘源酱汁蚕豆牛肉味*500g 约35小包','甘源酱汁蚕豆牛肉味*500g 约35小包',16.50,'img/sm/5f_1.5.jpg','details.html?lid=92'),
    (NULL,5,'芳草香草瓜子218g','芳草香草瓜子218g',14.00,'img/sm/5f_1.6.jpg','details.html?lid=93'),
    (NULL,5,'沃隆每日坚果A款 成人款25g','沃隆每日坚果A款 成人款25g',3.80,'img/sm/5f_1.7.jpg','details.html?lid=94'),
    (NULL,5,'TOMS蜂蜜黄油扁桃仁35g','TOMS蜂蜜黄油扁桃仁35g',5.00,'img/sm/5f_1.8.jpg','details.html?lid=95');

#创建详情页数据
CREATE TABLE shop_details(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    fid INT,
    title VARCHAR(32),
    price DECIMAL(10,2),
    prev_price DECIMAL(10,2),
    yh_price DECIMAL(10,2),
    bianhao VARCHAR(32),
    pingpai VARCHAR(16),
    chandi VARCHAR(32),
    kouwei VARCHAR(16),
    guige VARCHAR(16),
    jifen  INT,
    dates VARCHAR(16),


);








