module Payment
    class CreditCardPaymentProcessor < BasePaymentProcessor
        attr_reader :term, :student, :credit_card_num

        def initialize(term:, student:, context:)
            super
            @credit_card_num = context.fetch(:credit_card_num, '')
        end

        def process!
            true
        end

    end
end