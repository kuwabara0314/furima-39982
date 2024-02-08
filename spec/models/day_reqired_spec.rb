require 'rails_helper'

RSpec.describe DayReqired, type: :model do
  describe 'associations' do
    it { should have_many(:items) }
  end
end
