class UserMailer < ApplicationMailer
  def welcome_email
    @student = params[:student]
    @tname = params[:teacher]
    # @stud=Student.find(@student)
    @courses = CourseRegistration.find_by_sql("SELECT * from course_registrations where studentid=#{@student.id}")
    @course_name_array = []
    @courses.each do |i|
      @course_name=Course.find_by_sql("SELECT name from courses where id=#{i.courseid}")
      @course_name_array.append(@course_name)
    end
    mail(to: [@student.email] , subject: "IMP : Course Registration Update")
    #mail(to: , subject: "IMP : Course Registration Update")
  end
  def teacher_notify
    @tname = params[:teacher]
    @student = params[:student]
    @courses = CourseRegistration.find_by_sql("SELECT * from course_registrations where studentid=#{@student.id}")
    @course_name_array = []
    @courses.each do |i|
      @course_name=Course.find_by_sql("SELECT name from courses where id=#{i.courseid}")
      @course_name_array.append(@course_name)
    end
    mail(to: @tname.email, subject: "IMP : Course Registration Update")
  end
  def student_signedup
    @stud = params[:email]
    mail(to: @stud, subject: "Registration successful")
  end
end
