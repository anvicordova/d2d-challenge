# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern


  included do
    rescue_from ActiveRecord::NotNullViolation do |error|
      json_response({ message: error.message }, :unprocessable_entity)
    end
  end

  private

  def json_response(object, status = :ok)
    render json: object, status:
  end
end