#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      Simon
#
# Created:     30/03/2013
# Copyright:   (c) Simon 2013
# Licence:     <your licence>
#-------------------------------------------------------------------------------
#!/usr/bin/env python


f = open('C:\\Users\\Simon\\Downloads\\agid-4\\infl.txt', 'r')

counter = 0

for line in f:
    #to confirm that OK to break on space
    #if line[:line.find(':')].count(' ') > 1:
        #print line
    print 'wordlist[' + str(counter) +'] = "' + line[:line.find(' ')] + '"'
    counter += 1
    #if counter > 10: break


