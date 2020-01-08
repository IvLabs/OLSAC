#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32
from std_msgs.msg import Int32
from std_msgs.msg import String
import numpy as np
from beginner_tutorials.msg import vel
from beginner_tutorials.msg import command
from beginner_tutorials.msg import Num
from beginner_tutorials.msg import location
from beginner_tutorials.msg import pose
from beginner_tutorials.msg import wp
import RPi.GPIO as GPIO  
GPIO.setmode(GPIO.BCM)  
import time, threading

import smbus			#import SMBus module of I2C



GPIO.setwarnings(False)




PWR_MGMT_1   = 0x6B
SMPLRT_DIV   = 0x19
CONFIG       = 0x1A
GYRO_CONFIG  = 0x1B
INT_ENABLE   = 0x38
#ACCEL_XOUT_H = 0x3B
#ACCEL_YOUT_H = 0x3D
#ACCEL_ZOUT_H = 0x3F
#GYRO_XOUT_H  = 0x43
#GYRO_YOUT_H  = 0x45
GYRO_ZOUT_H  = 0x47



def MPU_Init():
	#write to sample rate register
	bus.write_byte_data(Device_Address, SMPLRT_DIV, 7)
	
	#Write to power management register
	bus.write_byte_data(Device_Address, PWR_MGMT_1, 1)
	
	#Write to Configuration register
	bus.write_byte_data(Device_Address, CONFIG, 0)
	
	#Write to Gyro configuration register
	bus.write_byte_data(Device_Address, GYRO_CONFIG, 24)
	
	#Write to interrupt enable register
	bus.write_byte_data(Device_Address, INT_ENABLE, 1)


def read_raw_data(addr):
	#Accelero and Gyro value are 16-bit
        high = bus.read_byte_data(Device_Address, addr)
        low = bus.read_byte_data(Device_Address, addr+1)
    
        #concatenate higher and lower value
        value = ((high << 8) | low)
        
        #to get signed value from mpu6050
        if(value > 32768):
                value = value - 65536
        return value



bus = smbus.SMBus(1) 	# or bus = smbus.SMBus(0) for older version boards
Device_Address = 0x68   # MPU6050 device address
   
global wpt
wpt = wp()
def change_vel(data):
	global r1
	global r2
	global st
	global n
	global wpt
	global position
	#wpt = wp()
	r1 = data.data.ref_left
	r2 = data.data.ref_right
	if r1*r2 < 0:
		
		wpt.way_pt.append(position)
		#wpt.way_pt[st].y = pose.y
		#st=st+1
		n=1
		if r1<0 and r2>0:
			n=-1
	foo()
#encoder pins
#GPIO.setup(5,GPIO.OUT)
#GPIO.setup(6,GPIO.OUT)

#left motor
GPIO.setup(27, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)  
#GPIO.setup(22, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)  
#right motor
GPIO.setup(23, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)  
#GPIO.setup(24, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
#pwm pins
#GPIO.setup(20, GPIO.OUT)
#GPIO.setup(21, GPIO.OUT)

GPIO.setup(6, GPIO.OUT)
GPIO.setup(12, GPIO.OUT) 
GPIO.setup(13, GPIO.OUT)      
GPIO.setup(5, GPIO.OUT)


global st
global r1
global countl
global countr 
countl=0.00
countr=0.00
RESOL=12.0
CIRCUM=3.14 * 7
WIDTH=18
x=0.00
y=0.00
disp=0.00

p = GPIO.PWM(6 , 100)
q = GPIO.PWM(12 , 100)
r = GPIO.PWM(13 , 100)
s = GPIO.PWM(5 , 100)
p.start(12)
q.start(0)
r.start(12)
s.start(0)

global theta 
theta =0.00
global r1
r1 =0.00
global r2
r2 =0.00
global kp1
kp1=0.1
global kp2
kp2 =0.1
global v1
v1=0.00
global v2
v2=0.00
CIRCUM=3.14*7
RESOL=12.0
x=0.00
y=0.00                  
global sum1
sum1=0.00
global sum2
sum2=0.00
global dc1
dc1=0.00
global dc2
dc2=0.00
global d2
d2=0.00
global n
n=1
global st
st =0


def left_motor(channel):  
	global countl	
	print("l")
		
	countl=countl+1
	foo()
	
def right_motor(channel):  
	global countr
	print("r")
	countr=countr+1
	foo()
     	
#interrupts
GPIO.add_event_detect(27, GPIO.RISING, callback=right_motor, bouncetime=40)
GPIO.add_event_detect(23, GPIO.RISING, callback=left_motor, bouncetime=40)  

global position
position = location()

def foo():
	try:
		print("m in foo start")
		global countl
		global countr
		global d1		
		global dc1
		global d2		
		global dc2
		global r1
		global r2
		global theta
		global x
		global y
		global n
		global position
		#position = location()
		
		e1 = abs(r1) - countl
		e2 = abs(r2) - countr
		#print(e1)
		#print(e2)
		d2=(0.3*e2)
		dc2 = dc2 + d2
		#print(d2)
		print("dc2 is %f"%dc2)
		#dc1 = (dc1/2000.00)+1
		
		d1=(0.3*e1)
		dc1 = dc1 + d1
		if r1<0:
			q.ChangeDutyCycle(dc2)
			r.ChangeDutyCycle(dc1)
		elif r2<0:
			p.ChangeDutyCycle(dc2)
			s.ChangeDutyCycle(dc1) 
		else:
			q.ChangeDutyCycle(dc2) 
			s.ChangeDutyCycle(dc1) 
		#print(d1)
		#print(dc1)
		#dc1 = (dc1/2000.00)+1

		
#theta change here		
		dtheta = ((n*( countl-countr)*RESOL*CIRCUM)/(WIDTH*360))
		#gyro_z = read_raw_data(GYRO_ZOUT_H)
		#Gz = (gyro_z+121)/131.0
		#print("gyro_z is %f"%gyro_z)		
		#dtheta = Gz*1
		theta = theta + dtheta
		print("dtheta is %f"%dtheta)
		dtheta = 0.00	
		print("theta is %f"%theta)	
		disp=((countl+countr)/2)*RESOL*(CIRCUM/360)
		x=x+(disp*np.sin(theta))            
		y=y+(disp*np.cos(theta))
		print("x is %f" %x)
		print("y is %f"%y)		
		position.data.x = x
		position.data.y = y
		position.data.theta = theta
		pub.publish(position)
		countl=0.00
		countr=0.00
		#SystemExit()
		print("m in foo end")
	except KeyboardInterrupt:
		exit()		
		pass
	threading.Timer(1, foo).start()
	

def return_back(data):
	global r1
	global r2
	global wpt
	#wpt = wp()
	for i in range(k):
		theta_calc = atan((wpt.way_pt[-1-k].y - curr_y)/(wpt.way_pt[-1-k].x - curr_x))
		theta_tbr = 90 - curr_theta - theta_calc
		a = (wpt.way_pt[-1-k].x, wpt.way_pt[-1-k].y, 0)
		b = (curr_x, curr_y, 0)
		dst = distance.euclidean(a, b)
		while (curr_theta-theta_tbr)>10:
			r1=15
			r2=-15
		while dst > 2:		
			r1=15
			r2=15
			a = (wpt.way_pt[-1-k].x, wpt.way_pt[-1-k].y, 0)
			b = (curr_x, curr_y, 0)
			dst = distance.euclidean(a, b)
		r1=0
		r2=0



if __name__ == '__main__':
	try:
		#MPU_Init()
		rospy.init_node('listener', anonymous=True)
		rospy.Subscriber('command_vel', command, change_vel)
		rospy.Subscriber('wapas', String, return_back)
		pub = rospy.Publisher('cord', location, queue_size=10)
		rate = rospy.Rate(10) # 10hz
		while not rospy.is_shutdown():
			#foo()
			rospy.spin()	
		
		#rate = rospy.Rate(10) # 10hz
		#GPIO.output(5,1)
		#GPIO.output(6,1) 
		#while not rospy.is_shutdown():
		#foo()
		#rospy.subscriber('command',vel,foo)
        	#pub.publish(countl)
			
		#pub.publish(countr)
        	#rate.sleep()

	except rospy.ROSInterruptException:
        	pass




