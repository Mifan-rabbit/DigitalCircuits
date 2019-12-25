### discription
本次实验使用实验板卡的系统时钟源产生0.5Hz、1Hz、2Hz周期信号及6s定时，使用2位的开关来选择输出周期信号和定时信号，使用1位LED灯显示周期或者定时信号：<br>
·SW[1:0] = 00: 产生0.5Hz信号送LED灯；<br>
·SW[1:0] = 01: 产生1Hz信号送LED灯；<br>
·SW[1:0] = 10: 产生2Hz信号送LED灯；<br>
·SW[1:0] = 11: 产生6s定时信号，即延时6s后，输出信号到LED灯；<br>
<br>
![实验原理](https://github.com/Mifan-rabbit/DigitalCircuits/blob/master/%E5%AE%9E%E9%AA%8C16/%E5%AE%9E%E9%AA%8C%E5%8E%9F%E7%90%86%E5%9B%BE.png)
实验原理
<br>
![分频器模块](https://github.com/Mifan-rabbit/DigitalCircuits/blob/master/%E5%AE%9E%E9%AA%8C16/%E5%88%86%E9%A2%91%E6%A8%A1%E5%9D%97.png)
分频器模块，输入信号n是分频系数，clk_out为分频输出的周期信号。<br>
 <br>
分频器和定时器的核心元件是一个计数器，通过对100MHz的时钟源计数来完成定时，继而分频。计时器的位数与分频的倍数有关，如果将1MHz的信号源分频为0.5Hz，则分频系数n为1M÷0.5=〖2×10〗^6，为产生方波，计数值为10^6，所以计数器为20位。
