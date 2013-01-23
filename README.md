#4D Pop-Up Book#

The 4D Pop-Up Book is a Processing application that allows you to trigger oncreen animations using a webcam and printed QR codes that can be embedded in a book. The animations are overlayed on top of the live webcam feed. [Click here to see a video demo](http://mehanjayasuriya.com/post/14377450769/above-youll-find-a-video-demo-for-the-4d-pop-up) of the application in action. 

The 4D Pop-Up book uses Google's XZing QR code library to decode the QR codes in real time. To use the XZing library, [follow the instructions in this MAKE article](http://blog.makezine.com/2011/03/02/codebox-use-qr-codes-in-processing/), in order to download and install the two pre-compiled Java files that make up the library.

Next, generate some QR codes using any QR code generator (I used [this one](http://qrcode.kaywa.com/)). In order to test this version of the app, you'll need codes that are embedded with the following text strings: "show skull," "show cat," "show pumpkin" and "show ghost". 

All of the images used for the animations are stored as .svg files in the "data" folder. Additionally, the "ghostClass" is used to animate the ghosts that appear on screen.

This application was written in [Daniel Rozin](http://www.smoothware.com/danny/)'s Introduction to Computational Media course at [NYU ITP](http://itp.nyu.edu). Shoutout to [Andrew Odewahn](https://twitter.com/odewahn) for writing the above-linked MAKE article, which served as my starting point for this project.