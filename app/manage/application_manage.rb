# frozen_string_literal: true

class ApplicationManage
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
