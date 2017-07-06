require 'rails_helper'

describe Picture do
  it { should have_and_belong_to_many(:tags) }

end
