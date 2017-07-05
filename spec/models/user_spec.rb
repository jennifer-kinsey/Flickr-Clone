require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :encrypted_password }
  it { should validate_presence_of :avatar_url }
end
