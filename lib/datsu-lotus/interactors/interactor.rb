module Interactors
end

module Interactor
  def call(*arguments)
    new.call(*arguments)
  end
end
