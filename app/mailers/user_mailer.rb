class UserMailer < ApplicationMailer
  def welcome_email
    @student = params[:student]
    @courses = CourseRegistration.find_by_sql("SELECT * from course_registrations where studentid=#{@student.id}")
    mail(to: @student.email, subject: "You got a new order!")
  end
end
