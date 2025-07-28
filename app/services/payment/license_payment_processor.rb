module Payment
    class LicensePaymentProcessor < BasePaymentProcessor
        attr_reader :term, :student, :license_code, :license

        def initialize(term:, student:, context:)
            super
            @license_code = context.fetch(:license_code, '')
            find_license
        end

        def process!
            return false if license.nil? || license.term != term

            license.activate!(student)
        end

        def find_license
            @license = License.find_by(code: license_code)
        end
    end
end