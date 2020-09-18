class UserMailer < ApplicationMailer
  def welcome_email
    @student = params[:student]
    # @stud=Student.find(@student)
    @courses = CourseRegistration.find_by_sql("SELECT * from course_registrations where studentid=#{@student.id}")

    @course_name_array = []

    @courses.each do |i|
      @course_name=Course.find_by_sql("SELECT name from courses where id=#{i.courseid}")
      @course_name_array.append(@course_name)
    end

    mail(to: @student.email, subject: "IMP : Course Registration Update")
  end
end
