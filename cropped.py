from turtle import width
import cv2
img=cv2.imread('images/pic7.jpg')

shape=img.shape
width=shape[0]
height=shape[1]

j=0
for i in range(20,width,10):
    width_img = img[j:i, 0:-1]
    j=i
    cv2.imwrite('images/width/width_'+str(i)+'.jpg',width_img)

j=0
for i in range(20,height,10):
    height_img = img[0:-1,j:i]
    j=i
    cv2.imwrite('images/height/height_'+str(i)+'.jpg',height_img)
