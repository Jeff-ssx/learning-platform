module Payment
    class PaymentFactory

        PROCESSORS = {
            'license' => LicensePaymentProcessor,
            'credit' => CreditCardPaymentProcessor
        }.freeze

        def self.build(type:, term:, student:, context: {})
            process_klass = PROCESSORS[type.to_s]
            raise ArgumentError, "Unknown payment type: #{type}" unless process_klass

            process_klass.new(term: term, student: student, context: context)
        end
    end
end