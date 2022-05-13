1. 项目背景：
recl为基于循环神经网络（LSTM）的心理健康平台，后端采用微服务进行开发，项目本来为大学生创新创业项目，已申请软著
循环神经网络模型利用深度学习框架Pytorch训练，目前训练了15万组对话，可模拟简单的咨询对话
recl仅为后端部分，循环神经网络模型为recl-seq2seq，recl-vue为前端部分

2.选用技术：SpringBoot + SpringCloud + MybatisPlus + JWT + RabbitMq + Redis + SpringSecurity
整个新项目采用微服务架构，设计SpringCloud的多数组件，包括：Nacos、Sentinel、GateWay、openFeign等

项目结构图：
![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/201715_0ee5772b_9797375.png "RTGX{I$3G[BTKN6P@L{{@PF.png")

common为通用模块：
common_utils为通用工具模块，1.包含了响应结果集：状态码、返回JSON、状态，Result的统一封装 2.MD5加密工具类 3.JWT工具类 4.redis工具类等
如图：
![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/202245_f331e190_9797375.png "QQ图片20220513202230.png")

service_base为全局的配置, 包含Redis、Redisson、Swagger-ui、MyabtisPlus插件等配置
如图：
![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/202624_32f0edec_9797375.png "QQ图片20220513202614.png")

spring_security为权限配置
如图：
![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/202829_057a639d_9797375.png "QQ图片20220513202820.png")



infrastructure为网关层的统一配置：包括跨域处理、请求过滤、请求转发
如图：
![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/203123_b2a81870_9797375.png "QQ图片20220513202956.png")

RabbitMq模块为rabbitmq的统一配置：包括队列、交换机、routingKey的配置和绑定、消息序列化、消息确认等配置
如图：
![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/203356_ff4dffe8_9797375.png "QQ图片20220513203349.png")

service里包含了所有的微服务模块：
如图：
![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/203534_60d11457_9797375.png "QQ图片20220513203524.png")

3.项目的文件统一保存在阿里云OSS，以下为阿里云OSS部分配置
![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/203958_53f9de89_9797375.png "QQ图片20220513203949.png")

4.项目实际运行界面
![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/205050_45d4d5cc_9797375.jpeg "QQ图片20220513205003.jpg")


![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/205100_d69d616b_9797375.jpeg "QQ图片20220513205015.jpg")

![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/205112_402a5a6f_9797375.jpeg "QQ图片20220513205021.jpg")

![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/205123_19c70e19_9797375.jpeg "QQ图片20220513205026.jpg")

![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/205133_cc4132e0_9797375.png "QQ图片20220513205032.png")

![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/205144_d7400297_9797375.png "图片1.png")

![输入图片说明](https://images.gitee.com/uploads/images/2022/0513/205157_9b35b779_9797375.png "图片2.png")


5.根据专业心里学量表研究、抽象并实现了粗分检验、标准分检验、判定因子检验三种方法


![输入图片说明](QQ%E5%9B%BE%E7%89%8720220513210020.png)
