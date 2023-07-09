# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(apples)
    super
    @label = apples
  end
end
