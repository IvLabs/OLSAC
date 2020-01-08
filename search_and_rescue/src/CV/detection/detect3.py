#!/usr/bin/env python3

import rospy
from CV.msg import Array
import cv2
import numpy as np


cap = cv2.VideoCapture(0)


def opencv():
	pub = rospy.Publisher('cvtosonar',Array, queue_size=100)
	rospy.init_node('opencv1', anonymous=True)
	
	return pub
	

#class ShapeDetector:
	#def __init__(self):
	#	pass
 
	#def detect(self, c):
		# initialize the shape name and approximate the contour
	#	shape =0.00
	#	peri = cv2.arcLength(c, True)
	#	approx = cv2.approxPolyDP(c, 0.04 * peri, True)
		# if the shape has 4 vertices, it is either a square or
		# a rectangle
	#	if len(approx) == 4:
			# compute the bounding box of the contour and use the
			# bounding box to compute the aspect ratio
		#	(x, y, w, h) = cv2.boundingRect(approx)
		#	ar = w / float(h)
 
			# a square will have an aspect ratio that is approximately
			# equal to one, otherwise, the shape is a rectangle
			#shape =1.00 if ar >= 0.90 and ar <= 1.10 else 0.00
 
		# otherwise, we assume the shape is a circle
		
		# return the name of the shape
	#	return shape
#



if __name__=='__main__':
	try:	
		#shape=0.00
		pub=opencv()
		#sd=ShapeDetector()
		while not rospy.is_shutdown():	
			#pub=opencv()
			rate = rospy.Rate(10) #rate is 10 hz
			#cap = cv2.VideoCapture(0)
			#take each frame
			_,frame = cap.read()
			#frame= cv2.resize(frame, dsize=None, fx=0.70,fy=0.70)
					
			#Convert BGR to HSV
			hsv  = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

			#define range of red color 
			#lower = np.array([3,120,120])
			#upper = np.array([10,255,255])

			
			#define range of green color
			lower= np.array([45,75,75])
			upper= np.array ([75,255,255])
		
			#define range of bluecolor
			#lower= np.array([110,75, 75])
			#upper = np.array([130, 255, 255])
			
			#threshold the hsv image to get only red color
			mask = cv2.inRange(hsv,lower, upper)
		
			#threshold the hsv image to get only red color
			#mask_green = cv2.inRange(hsv,lower_green, upper_green )
			
			area1=[]
			
			align=[]
			height=[]
			#area_g=0
			cnt=0
			#cnt_g=0
			area=0.00
			ht=0.00
			

			image, contours,hierarchy = cv2.findContours(mask,cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
			#image_green, contours_green, hierarchy_green = cv2.findContours(mask_green, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
			
			cv2.drawContours(frame, contours,-1,(0,255,0),3) 	
			#cv2.drawContours(frame, contours_green, -1, (255,0,0),3)	
			
			count=len(contours)
			#g_count=len(contours_green)
			area1.append(0)
			align.append(50)
			height.append(100)
			for n in range(count):
				
				#print(cv2.contourArea(contours[n]))
				area = cv2.contourArea(contours[n])
				if area>250:
					area1.append(area)
					cnt=contours[n]
					M = cv2.moments(cnt)
					if M["m00"]!=0:
					#calculate  and y of centroid
						cX = int(M["m10"] / M["m00"])
						cY = int(M["m01"] / M["m00"])
						peri = cv2.arcLength(cnt, True)
						#shape.append(sd.detect(cnt))		
					else:
						cX, cY = 0, 0

					ht=(peri-np.sqrt((peri**2)-(16*area))/4)
					height.append(ht)
					
					
					if (cX>0 and cX<212):	
						align.append(-1.00)
						#trans=[area1,-1.00, shape]
				#print(shape)
					elif(cX>212 and cX<425):
						align.append(0.00)
#						trans=[area1, 0.00, shape]
				#print(shape)
					else:
						align.append(1.00)				
#						trans=[area1, 1.00, shape]
            if count!=0:			
				rospy.loginfo(area1)
				rospy.loginfo(align)
				rospy.loginfo(height)
				print(count)
				pub.publish(area1)
				pub.publish(align)
				pub.publish(height)
				
				rate.sleep()
				area1.clear()
				align.clear()
				height.clear()
				print("ho gaya")
	
			cv2.imshow('Contours',frame)              
			k=cv2.waitKey(10) & 0xFF
			if k==27:
						break	
	except rospy.ROSInterruptException:
		pass
