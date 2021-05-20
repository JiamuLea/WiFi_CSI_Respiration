# WiFi_CSI_Respirotary
本仓库是毕业设计《基于无线信号非静止状态呼吸心跳检测》的概念验证代码，其中各目录包含的部分如下说明：

* **data:** 部分收集到的CSI数据
* **TestData:** 部分用以测试算法和系统性能的测试数据，包含由手机陀螺仪收集到的真实值对照数据
* **RoughHandling：** 初步处理，读取CSI数据，转化为矩阵格式，并绘制CSI波形图
* **HumanDetection：** 使用DBSCAN聚类判断环境中是否有人存在，排除无人时的环境噪声干扰，首先将CSI数据分窗，提取特征向量，再使用聚类方法聚类判断。
* **AmplitudeProcess：** CSI幅度处理代码，仅用于静止状态
* **PhaseProcess：** CSI相位处理代码，仅用于静止状态
* **DynamicProcess：** 运动状态下的呼吸心跳提取代码

其余文件夹外的代码为CSI_Tool的原始CSI处理代码。
