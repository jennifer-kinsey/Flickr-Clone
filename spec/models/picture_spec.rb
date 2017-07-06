require 'rails_helper'

describe Picture do
  it { should have_many(:tags) }

end
