require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  describe 'associations' do
    it { should have_many(:items) }
  end
end