# README

Welcome to Course Manager, your guide to registering the right courses you need. In order to access the application please open a browser and type the following in the address bar : http://3.131.93.190:3000/
Note: Please note you can find some of the existing values for the tables created in the seeds.rb file.

* Admin credentials are ->` e-mail : admin@admin.com , password : admin123` 

If you are unable to sign up as a student, please use the following credentials: 
* Student credentials are ->` e-mail : skumar32@ncsu.edu , password : 1234567`  

If you are unable to sign up as a teacher, please use the following credentials: 
* Student credentials are ->` e-mail : testcase1230@gmail.com , password : 123456`  


#### Sign Up procedure: 

* The default page when you access the application is the 'Login' page.
* Click on 'sign up' and it will redirect you to the sign up page.
Enter your details. 
* Make sure you use a valid-email ID (to get email updates for course updates via mail) for the sign up process

#### Sign In procedure:
* Access the following IP address : http://3.131.93.190:3000/.
* Enter your user-email and password to log in and click on log in button.

#### teacher : signing up for a course 
* Teachers can choose which course they should teach.
* Once a teacher logs into a teacher account, the teacher needs to click on 'view courses' under the heading 'teaching courses'
* Then the teacher can see the list of courses that the teacher is eligible to teach.
* The teacher needs to click on 'register' button to register as a teacher for that course

#### teacher : dropping a course 
* Teachers can choose which course they should teach.
* Once a teacher logs into a teacher account, the teacher needs to click on 'view courses' under the heading 'teaching courses'
* Then the teacher can see the list of courses that the teacher is eligible to teach.
* The teacher needs to click on 'drop' button to drop a course. Please note if the teacher drops a course, then the students registered for the course under this faculty also become unregistered.

#### student : signing up for a course 
* Students can choose which course they want to study.
* Once a student logs into a student account, the students needs to click on 'register courses'.
* Then the student can see the list of courses that he is eligible to register.
* The student needs to click on 'add to cart' button to register as course.
* After the student has registered for all the course that he wants to register , he needs to checkout the cart.
* Once he checkout he needs to fill in the card details , or use an already existing card.
* After the checkout is complete the student can see all his registered course details.
* A student can not register for a course until and unless a teacher has enrolled in taking up that course.


### Student: Payment gateway
* When the courses have been added to the cart, a user needs to have the card details present for the checkout option to appear. 
* After attaching the new payment details you would be redirected to the cart page and the user needs to visit the payment page again in order for the checkout option to appear. 
* On clicking the Checkout button, the user is redirected to Cart page and the confirmation message above the navbar confirms the update in course registration.
* Furthermore, on clicking the checkout button, the student and the teacher under which the course was registered receive mails about the course confirmation.


#### Admin : signing in as admin
* After the admin has logged in , the admin can perform the following operations 
* Admin can do CRUD operations for students, teachers and courses.
* Admin can assume roles for any of the user categories by clicking on the relevant options available on the menu.
* Below is the shown example as to how an admin can assume the role of the student and perform operations on his behalf.

![image](https://user-images.githubusercontent.com/7301586/93657919-bb745d00-fa04-11ea-9147-89772aa76ace.png)

* The same can be done for teachers as well.
* When an admin is required to create a new student and teacher, he is logged out and redirected to the sign up page. There were some issues when we tried having this functionality combined on the admin page itself. 

#### Corner case handling
* All the routes present in the application are checked for authorization. For example, a student with id 1 will never be able to view the profile page of student 2.
* An email is sent when a user signs up with the application. Emails are also sent when a student signs up for a class with a teacher.
* When a user tries to delete an admin account, an alert pops up to prevent such an action.
* Teacher should be signed up for one of the courses for which the student is looking to register the course.
* A new user gets an email on signing up and filling out the form attached with the relevant category.
* A license has been attached to the repo.

For any feedback, please contact the below mentioned folks : 

***Team Members***

Amol Gautam (agautam6@ncsu.edu)

Palash Gupta (pgupta25@ncsu.edu)

Sneha Kumar (skumar32@ncsu.edu)

