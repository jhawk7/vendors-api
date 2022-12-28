# Error module to Handle errors globally
# include Error::ErrorHandler in application_controller.rb
module Error
    #custom errors
    class ArgumentError < StandardError; end

    module ErrorHandler
      def self.included(clazz)
        clazz.class_eval do
            rescue_from StandardError do |e|
                respond(:standard_error, 500, e.to_s)
            end

            rescue_from Error::ArgumentError do |e|
                respond(:argument_error, 400, e.to_s)
            end

            rescue_from ActiveRecord::RecordNotFound do |e|
                respond(:record_not_found, 404, e.to_s)
            end
        end
      end
  
      private
      def respond(_error, _status, _message)
        render json: {:error => _error, :message => _message}, status: _status
      end
    end
  end