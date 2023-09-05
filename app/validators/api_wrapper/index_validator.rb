# frozen_string_literal: true

module ApiWrapper
  class IndexValidator < ApplicationValidator
    params do
      optional(:activity).maybe(:string)
      optional(:type).maybe(:string)
      optional(:participants).maybe(:integer)
      optional(:minprice).maybe(:float)
      optional(:maxprice).maybe(:float)
      optional(:minaccessibility).maybe(:float)
      optional(:maxaccessibility).maybe(:float)
    end
  end
end
