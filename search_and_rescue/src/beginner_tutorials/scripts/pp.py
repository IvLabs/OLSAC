#!/usr/bin/env python

import rospy
from beginner_tutorials.msg import Num
from std_msgs.msg import Float32
from std_msgs.msg import String
from beginner_tutorials.msg import command
from beginner_tutorials.msg import info
from beginner_tutorials.msg import single
from beginner_tutorials.msg import vel
from beginner_tutorials.msg import info
from beginner_tutorials.msg import dist1
from beginner_tutorials.msg import dist2
from std_msgs.msg import Int32
import struct
global temp
temp = 0.00
global pub
global pub1
global pub2
def done_or_not(data):
	if data.ans=='yes' :
		i=i-1
#condition when i=0
def data_from_cv(data):
	#global pass_struct
	#pass_struct.pack('fif',height,align,area)
	#s=data.array
	rospy.loginfo("m in data from cv")
	rospy.loginfo(data.array)
	rospy.sleep(10)
	#pass_struct = data.array[-1]
#it should be data.array[-1](all three element)
	temp = data.array.height[-1]
	#temp = __getitem__(pass_struct,-1)
#it should be data.array[-1].align
	approach(data.array.align[-1])
	#approch(__getitem__(pass_struct,-1))

##global pass_struct

#def __getitem__(data_cv,index):
#	return data.array[index].distance

def sensor():
	s2=data

def turn_right():
# where is command
	a1 = command()
	a1.data.ref_left = -15 
	a1.data.ref_right = 15
	pub.publish(a1)
	global pub
	return 'done'


def turn_left():
	a1 = command()
	a1.data.ref_left = 15 
	a1.data.ref_right = -15
	pub.publish(a1)
	global pub
	return 'done' 


def centre():
	# message to gou to check
	#pub=rospy.Publisher('topic_name', String, queue_size=10)
	#path_str="done?"
	#pub.publish(path_str)
	global temp
	global pub1
	print("m here in centre")
#where is dist2
	p1 = dist2()
	p1.data.distance = temp
	p1.data.dir = 0
	pub1.publish(p1)
	return 'done'






def ack(data):
	if data.data == "proceed" :
		a1 = command()
		a1.data.ref_left = 15 
		a1.data.ref_right = 15
		pub.publish(a1)
	else:
		global i
		i=i-1
		


def tagged():
	rospy.sleep(5)
	pub2.publish("wapas_jaa")

def start():
	global pub
	global pub1
	global pub2
	rospy.init_node('path_planning', anonymous=True)	
	rospy.Subscriber('cvtopp', info, data_from_cv)
	pub=rospy.Publisher('command_vel', command, queue_size=10)
	pub1=rospy.Publisher('update_n_check', dist2, queue_size=10)
	pub2=rospy.Publisher('wapas', String, queue_size=10)
	rospy.Subscriber('ogu_ack', String, ack)
	rospy.Subscriber('/sonar_dist', Float32, tagged)
	rate = rospy.Rate(10)
	print("m in start")

		
	
def approach(value):
	print("value is %f"%value)
	switcher = {
		1:lambda:turn_right(),
       		-1:lambda:turn_left(),
		0:lambda:centre()
	}
	print("m here in approach")
	return switcher.get(value,lambda:"abc")()

#make tapped object obstacle & go back (function for that)
if __name__ == '__main__':
	try:
		start()
		global i
		i = -1
		while not rospy.is_shutdown():
			print("m here")
			r1=40
			print("m here1")
			r2=-40
			rospy.spin()
	except KeyboardInterrupt:
		pass
			
	
	#rospy.Subscriber('gou',string,done_or_not)
	#rospy.subscriber('cvtosonar',variable-length array[],data_from_cv))
	#rospy.spin()                                     

