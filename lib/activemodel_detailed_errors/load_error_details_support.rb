module ActiveModel
  class Errors
    MESSAGE_OPTIONS = [:message]

    attr_accessor :details

    def initialize(base)
      @base     = base
      @messages = Hash.new { |messages, attribute| messages[attribute] = [] }
      @details  = Hash.new { |details, attribute| details[attribute] = [] }
    end

    def initialize_dup(other) # :nodoc:
      @messages = other.messages.dup
      @details  = other.details.deep_dup
      super
    end

    def clear
      messages.clear
      details.clear
    end

    def delete
      messages.delete(key)
      details.delete(key)
    end

    def add(attribute, message = :invalid, options = {})
      message = message.call if message.respond_to?(:call)
      detail  = normalize_detail(attribute, message, options)
      message = normalize_message(attribute, message, options)
      if exception = options[:strict]
        exception = ActiveModel::StrictValidationFailed if exception == true
        raise exception, full_message(attribute, message)
      end

      details[attribute.to_sym] << detail
      self[attribute] << message
    end

    def added?(attribute, message = :invalid, options = {})
      message = message.call if message.respond_to?(:call)
      message = normalize_message(attribute, message, options)
      self[attribute].include? message
    end

    private

    def normalize_detail(attribute, message, options)
      { error: message }.merge(options.except(*CALLBACKS_OPTIONS + MESSAGE_OPTIONS))
    end
  end
end
