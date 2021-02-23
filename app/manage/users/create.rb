# frozen_string_literal: true

module Users
  class Create < ApplicationManage
    def initialize(params)
      @params = params
    end

    def call
      User.create!(params)
    end

    private

    attr_reader :params
  end
end
