# -
现代控制理论实验课
matlab倒立摆仿真代码和动画演示
使用matlab的倒立摆建模和仿真设计
使用了状态反馈控制器设计闭环反馈控制系统
实现了动画演示

文档说明：
系统分析文件夹
A .m 输入为加速度的情况下的开环系统
F .m输入为力 开环系统
F_Gs\.mdl输入为力的传函的simulink
F_State.....输入为力的状态方程的simulink
A_State.....输入为加速度的状态方程的simulink
State_FeedBack_controller.m 输入为加速度m文件
State_FeedBack_controller_input_F输入为力F的m文件
State_Feedback.....01 .mdl状态反馈的闭环反馈控制器 系统的simulink


dh文件夹
	sys.m  生成整个控制系统的s函数
	pendan.m显示动画的s函数
	dh.mdl 最终的动画倒立摆
