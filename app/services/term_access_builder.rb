class TermAccessBuilder
    attr_reader :student, :term, :payment_method, :term_access, :context, :processor

    def initialize(student:, term:, payment_method:, context:)
        @student = student
        @term = term
        @payment_method = payment_method
        @context = context

        @processor = Payment::PaymentFactory.build(
            type: payment_method,
            term: term,
            student: student,
            context: context
        )
    end

    def call
        ActiveRecord::Base.transaction do
            unless processor.process!
                raise ActiveRecord::Rollback, "Failed to process payment"
            end

            @term_access = TermAccess.new(
                student: student,
                term: term,
                payment_method: payment_method
            )

            # returning save success or not
            unless term_access.save
                raise ActiveRecord::Rollback, "Failed to create term access"
            end
        end

        term_access.persisted?
    end
end
