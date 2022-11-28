#! /usr/bin/env python3
import rospy
from std_msgs.msg import String
if __name__=="__main__":
    rospy.init_node("test_node", log_level=rospy.DEBUG)
    pub = rospy.Publisher("topic_poop", String, queue_size=10)
    while not rospy.is_shutdown():
        pub.publish("fuck")
        rospy.sleep(1)
        
