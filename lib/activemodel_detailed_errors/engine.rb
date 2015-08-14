module ActivemodelDetailedErrors
  class Engine < ::Rails::Engine
    initializer "include .details method in ActiveAdmin" do |app|
      unless ActiveModel::Errors.methods.include?(:details)
        require "activemodel_detailed_errors/load_error_details_support"
      end
    end
  end
end
