#!/usr/bin/env python

import array 
from beginner_tutorials.msg import pose
from std_msgs.msg import String
from beginner_tutorials.msg import dist2
from beginner_tutorials.msg import dist1
from beginner_tutorials.msg import vel
from beginner_tutorials.msg import command
from beginner_tutorials.msg import Num
from beginner_tutorials.msg import location
from beginner_tutorials.msg import pose
from beginner_tutorials.msg import wp
import numpy as np
import rospy
import math
#from scipy.spatial import distance



#def signal_handler(signal, frame): # ctrl + c -> exit program
 #       print('You pressed Ctrl+C!')
  #      sys.exit(0)
#signal.signal(signal.SIGINT, signal_handler)

rows, cols = (460, 460) 
arr = [[0.5 for i in range(cols)] for j in range(rows)]



curr_x = 0.00
curr_y = 0.00
curr_theta = 0.00	
def occupy():
#check if it is 8 dont say i will change afterword do it now
	curr_x += 8(np.sin(theta))
	curr_y += 8(np.cos(theta))

	k_x = int(math.floor(curr_x-10))
	k_y = int(math.floor(curr_y-10))

	for i in range(10):
		arr[k_x][k_y + i] = 1
		arr[k_x+10][k_y + i] = 1
	for i in range(10):
		arr[k_x+i][k_y] = 1
		arr[k_x+i][k_y + 10] = 1

def mpu(data):
	curr_theta = data
#data from pp to update distance
def dist_update(data):
	dist = data
	x = curr_x + (23.00 + dist)*(np.sin(curr_theta))
	y = curr_y + (23.00 + dist)*(np.cos(curr_theta))

	for i in range(20):
		for j in range(20):
			k_x = int(math.floor(curr_x + (23 + dist +i)(np.sin(curr_theta)) + (j-10)(np.cos(curr_theta))))
			k_y = int(math.floor(curr_y + (23 + dist +i)(np.cos(curr_theta)) + (j-10)(np.sin(curr_theta))))
			arr[k_x][k_y] += 0.9 
	for i in range(floor(dist)):
		for j in range(20):
			k_x = int(math.floor(curr_x + (23+i)(np.sin(curr_theta)) + (j-10)(np.cos(curr_theta))))
			k_y = int(math.floor(curr_y + (23+i)(np.cos(curr_theta)) + (j-10)(np.sin(curr_theta))))
			arr[k_x][k_y] += -0.7

	
	
#def check(data):
#	dist = data
#	x = curr_x + (23 + data)(np.sin(curr_theta))
#	y - curr_y + (23 + data)(np.cos(curr_theta))
#
#	k_x = floor(x)
#	k_y = floor(y)
#	
#	if arr[k_x][k_y] > 0.5 :
#		pub.publish("occupied")
#	elif arr[k_x][k_y] < 0.5 :
#		pub.publish("non_occupied")
#	else 
#		pub.publish("unexplored")		

global curr_x
global curr_y
curr_x =0.00
curr_y =0.00
def unc(data):
	dist=data.data.distance
	global pub1
	global curr_x
	global curr_y
	x = curr_x + (23.00 + dist)*(np.sin(curr_theta))
	y = curr_y + (23.00 + dist)*(np.cos(curr_theta))
#keep buffer here exact value wont match may be checking middle or something would work
	k_x = int(math.floor(x))
	k_y = int(math.floor(y))

	if arr[k_x][k_y] > 0.5 :
		pub1.publish("proceed")
		dist_update(dist)
	else:
		pub1.publish("already tagged")
		

def current_cord(data):
	global curr_x
	global curr_y
	curr_x = data.data.x
	curr_y = data.data.y
	curr_theta = data.data.theta		#w refer to theta
	occupy()



global pub1
pub1 = String()

def grid_update():
	global pub1
	
	rospy.init_node('gu_node', anonymous=True)
	#rospy.Subscriber('MPU_node', Float32, mpu)	#in .msg int32 cell
	#rospy.Subscriber('ogu_node', Float32, dist_update)	#in .msg int32 cell
	#rospy.Subscriber('grid_check_node', Float32, check)	#in .msg int32 cell
	#pub = rospy.Publisher('confirm', Float32, queue_size=10)
	rospy.Subscriber('cord', location, current_cord)
	rospy.Subscriber('update_n_check', dist2, unc)
	pub1 = rospy.Publisher('ogu_ack', String, queue_size=10)
	#rospy.Subscriber('wp_node', pose, way_pt)
	rate = rospy.Rate(10)		
	rospy.spin()

if __name__ == '__main__':
	try:
		grid_update()
	except rospy.ROSInterruptException:
		pass
