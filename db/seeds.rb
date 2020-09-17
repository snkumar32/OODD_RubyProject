# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
user = User.create!  :email => 'admin@admin.com', :password => 'admin123', :password_confirmation => 'admin123', :category => 'admin'
s1 = User.create!  :email => 'skumar32@ncsu.edu', :password => 'sneha123', :password_confirmation => 'sneha123', :category => 'Student'
s2 = User.create!  :email => 'pgupta25@ncsu.edu', :password => 'palash123', :password_confirmation => 'palash123', :category => 'Student'
s2 = User.create!  :email => 'agautam6@ncsu.edu', :password => 'amol123', :password_confirmation => 'amol123', :category => 'Student'

t1 = User.create!  :email => 'teacher1@ncsu.edu', :password => 'teacher1abc', :password_confirmation => 'teacher1abc', :category => 'Teacher'
t2 = User.create!  :email => 'teacher2@ncsu.edu', :password => 'teacher2abc', :password_confirmation => 'teacher2abc', :category => 'Teacher'
t3 = User.create!  :email => 'teacher3@ncsu.edu', :password => 'teacher3abc', :password_confirmation => 'teacher3abc', :category => 'Teacher'
t4 = User.create!  :email => 'teacher4@ncsu.edu', :password => 'teacher4abc', :password_confirmation => 'teacher4abc', :category => 'Teacher'
t5 = User.create!  :email => 'teacher5@ncsu.edu', :password => 'teacher5abc', :password_confirmation => 'teacher5abc', :category => 'Teacher'
t6 = User.create!  :email => 'teacher6@ncsu.edu', :password => 'teacher6abc', :password_confirmation => 'teacher6abc', :category => 'Teacher'


s11 = Student.create! :name => 'Sneha', :email => 'skumar32@ncsu.edu', :address => 'Raleigh', :phone => '98765678', :major => 'CSC'
s21 = Student.create! :name => 'Palash', :email => 'pgupta25@ncsu.edu', :address => 'Raleigh', :phone => '98123678', :major => 'CSC'
s31 = Student.create! :name => 'Amol', :email => 'agautam6@ncsu.edu', :address => 'Raleigh', :phone => '98123578', :major => 'CSC'

t11 = Teacher.create! :name => 'Teacher1', :email => 'teacher1@ncsu.edu', :address => 'Raleigh', :phone => '38765678', :discipline => 'CSC'
t21 = Teacher.create! :name => 'Teacher2', :email => 'teacher2@ncsu.edu', :address => 'Raleigh', :phone => '38565678', :discipline => 'CSC'
t31 = Teacher.create! :name => 'Teacher3', :email => 'teacher3@ncsu.edu', :address => 'Raleigh', :phone => '38775678', :discipline => 'CSC'
t41 = Teacher.create! :name => 'Teacher4', :email => 'teacher4@ncsu.edu', :address => 'Raleigh', :phone => '38785678', :discipline => 'ECE'
t51 = Teacher.create! :name => 'Teacher5', :email => 'teacher5@ncsu.edu', :address => 'Raleigh', :phone => '38795678', :discipline => 'ECE'
t61 = Teacher.create! :name => 'Teacher6', :email => 'teacher6@ncsu.edu', :address => 'Raleigh', :phone => '38795618', :discipline => 'CN'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ''''
=end
c1 = Course.create! :name => 'Operating System', :number => '501', :discipline => 'CSC', :area => 'Systems', :price => '100'
c2 = Course.create! :name => 'Database', :number => '540', :discipline => 'CSC', :area => 'Systems', :price => '150'
c3 = Course.create! :name => 'Software Engineering', :number => '510', :discipline => 'CSC', :area => 'SE', :price => '130'
c4 = Course.create! :name => 'Digital Circuit Design', :number => '410', :discipline => 'ECE', :area => 'Design', :price => '160'
c5 = Course.create! :name => 'Digital Signal Processing', :number => '415', :discipline => 'ECE', :area => 'Signal Processing', :price => '130'
c6 = Course.create! :name => 'Computer Networks', :number => '670', :discipline => 'CN', :area => 'Networks', :price => '100'
c7 = Course.create! :name => 'Internet Protocol', :number => '671', :discipline => 'CN', :area => 'Networks', :price => '130'




