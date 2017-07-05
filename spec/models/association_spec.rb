require 'rails_helper'

describe Association do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :picture_id }
  it { should validate_presence_of :typification}
end
