class CourseEnrollmentBuilder
    attr_reader :student, :course, :course_enrollment
    def initialize(student:, course:)
        @student = student
        @course = course
    end

    def call
        @course_enrollment = CourseEnrollment.new(
            student: student,
            course: course
        )

        # returning save success or not
        course_enrollment.save
    end
end