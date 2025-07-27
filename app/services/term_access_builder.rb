class TermAccessBuilder
    attr_reader :student, :term, :payment_method, :term_access

    def initialize(student:, term:, payment_method:)
        @student = student
        @term = term
        @payment_method = payment_method
    end

    def call
        @term_access = TermAccess.new(
            student: student,
            term: term,
            payment_method: payment_method
        )

        # returning save success or not
        term_access.save
    end
end