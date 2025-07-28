module Payment
    class BasePaymentProcessor
        attr_reader :term, :student, :context

        def initialize(term:, student:, context:)
            @term = term
            @student = student
        end

        def process!
            raise NoMethodError
        end
    end
end