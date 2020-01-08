#!/usr/bin/env python3

import rospy
from CV.msg import Array
import cv2
import numpy as np
from CV.msg import single
import imutils
from CV.msg import info


cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)


def opencv():
	pub = rospy.Publisher('cvtopp',info, queue_size=100)
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
			lower = np.array([170,120,120])
			upper = np.array([180,255,255])

			
			#define range of green color
			#lower= np.array([45,75,75])
			#upper= np.array ([75,255,255])
		
			#define range of bluecolor
			#lower= np.array([110,75, 75])
			#upper = np.array([130, 255, 255])
			
			#threshold the hsv image to get only red color
			mask = cv2.inRange(hsv,lower, upper)
		
			#threshold the hsv image to get only red color
			#mask_green = cv2.inRange(hsv,lower_green, upper_green )
			p=info()
			#area1=[]
			
		#	align=[]
		#	height=[]
			#area_g=0
			cnt=0
			#cnt_g=0
			area=0.00
			ht=0.00
						
			

			
			contours,hierarchy = cv2.findContours(mask,cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
			#image_green, contours_green, hierarchy_green = cv2.findContours(mask_green, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
			#contours=sorted(contours, key=cv2.contourArea, reverse=True)[0]
			contours.sort(key=cv2.contourArea, reverse=True)
			x=[]
			y=[]
			max_ht=0
			count1=0
			flag=0
													
										
					#print(max(x))
					#print(max(y))					
				#print(approx[1][0][0])				
					#print(approx)
				#extLeft = (max(contours[contours[:, :, 0]]))
				#extRight = (contours[contours[:, :, 0].argmax()][0])
				#extTop = (contours[contours[:, :, 1].argmin()][0])
				#extBot = (contours[contours[:, :, 1].argmax()][0])
				
			
			#print(len(approx))
			#for i in range(len(edges)):
			#	print(edges)
				#print(extLeft)
				#frame_crop=frame[approx[0,0,1]:approx[2,0,1], approx[0,0,0]: approx[2,0,0]]
				#cv2.imshow('Contours',frame_crop) 
							
			#print(len(contours))
				#cv2.drawContours(frame, approx,-1,(0,0,255),3)
			cv2.drawContours(frame, contours,-1,(0,255,0),3) 	
			#cv2.drawContours(frame, contours_green, -1, (255,0,0),3)	
			
			count=len(contours)
			#g_count=len(contours_green)
			#area1.append(0)
			#align.append(50)
			#height.append(100)
			for n in range(count):
				
				#print(cv2.contourArea(contours[n]))
				area1 = cv2.contourArea(contours[n])
				if area1>500:
					#if len(contours)!=0:
					epsilon = 0.1*cv2.arcLength(contours[n],True)
			#else:
			#	epsilon=0
					approx = cv2.approxPolyDP(contours[n],epsilon,True)
					if len(approx)==4:
						for i in range(4):
							x.append(approx[i][0][0])
							y.append(approx[i][0][1])
						x_max=max(x)
						x_min=min(x)
						y_max=max(y)		
						y_min=min(y)
						frame1=frame[y_min-50:y_max+50, x_min-50:x_max+50]
				#		print(frame1)1
						edges = cv2.Canny(frame1,100,200)
					#for i in range					
					#print(len(edges))
					#print(np.shape(edges))
						for i in range(len(edges[0])):
					#	for j in range(edges)
							a=(np.where(np.isin(edges[:,i], 255)))
							if(len(a[0])!=0):
								for i in range(1,len(a[0])):
									if (a[0][i]-a[0][i-1])<=2:
										count1=count1+1
										flag=1
									#	print("every height %d" %count1)
									#	print(a[0])
									elif flag==1:
										flag=0
										break
									#count1=0
								if count1>max_ht:
									max_ht=count1
									print("max height %d " %max_ht)
								count1=0	
													
						#print(max_ht)
						#print(a[0])
						cv2.imshow('crop',edges)					
						k=cv2.waitKey(10) & 0xFF
						if k==27:
							break

					
					
					p.array.area.append(area1)
					cnt=contours[n]
					M = cv2.moments(cnt)
					if M["m00"]!=0:
					#calculate  and y of centroid
						cX = int(M["m10"] / M["m00"])
						cY = int(M["m01"] / M["m00"])
						#peri = cv2.arcLength(cnt, True)
						#shape.append(sd.detect(cnt))		
					else:
						cX, cY = 0, 0

					#ht=(peri-np.sqrt((peri**2)-(16*area))/4)
					p.array.height.append(max_ht)
					
					if (cX>0 and cX<212):	
						#align.append(-1.00)
						#p.array.append=[area1,-1, ht]
						p.array.align.append(-1)
				#print(shape)
					elif(cX>212 and cX<425):
						#align.append(0.00)
						p.array.align.append(0)
						#p.array.append=[area1, 0, ht]
				#print(shape)
					else:
						#align.append(1.00)				
						#p.array.append=[area1, 1, ht]
						p.array.align.append(1)
				max_ht=0
			if count!=0:			
				rospy.loginfo(p)
				#print(count)
				pub.publish(p)
				n=0
				rate.sleep()
				p.array.area.clear()
				p.array.align.clear()
				p.array.height.clear()
				print("ho gaya")
	
			cv2.imshow('Contours',frame) 
			#cv2.imshow('Canny',approx)              
			k=cv2.waitKey(10) & 0xFF
			if k==27:
				break	
	except rospy.ROSInterruptException:



		pass
